import { Turbo } from "@hotwired/turbo-rails"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

import "javascripts/locations"
import "locations"


Rails.start();
Turbolinks.start();
ActiveStorage.start();

//= require jquery3
//= require_tree .

import $ from 'jquery';
global.$ = jQuery;

document.addEventListener("DOMContentLoaded", function() {
  const searchInput = document.querySelector('.search-bar input');
  const resultsContainer = document.createElement('div');
  resultsContainer.classList.add('search-results');
  searchInput.parentNode.appendChild(resultsContainer);

  searchInput.addEventListener('input', function() {
    const query = searchInput.value;

    if (query.length > 2) {
      fetch(`/search?query=${query}`, {
        headers: {
          'Accept': 'application/json'
        }
      })
      .then(response => response.json())
      .then(data => {
        resultsContainer.innerHTML = '';
        if (data.products.length === 0 && data.categories.length === 0) {
          resultsContainer.style.display = 'none';
        } else {
          resultsContainer.style.display = 'block';
          data.products.forEach(product => {
            const productElement = document.createElement('a');
            productElement.href = product.url;
            productElement.textContent = product.name;
            productElement.classList.add('list-group-item', 'list-group-item-action');
            resultsContainer.appendChild(productElement);
          });
          data.categories.forEach(category => {
            const categoryElement = document.createElement('a');
            categoryElement.href = category.url;
            categoryElement.textContent = category.name;
            categoryElement.classList.add('list-group-item', 'list-group-item-action');
            resultsContainer.appendChild(categoryElement);
          });
        }
      });
    } else {
      resultsContainer.innerHTML = '';
      resultsContainer.style.display = 'none';
    }
  });

  document.addEventListener('click', function(event) {
    if (!searchInput.contains(event.target) && !resultsContainer.contains(event.target)) {
      resultsContainer.innerHTML = '';
      resultsContainer.style.display = 'none';
    }
  });
});

document.addEventListener("DOMContentLoaded", function() { 
  var shopMarkers = window.shopsData;
  var eventMarkers = window.eventsData;
  var map = new ol.Map({
    target: 'map',
    layers: [
      new ol.layer.Tile({
        source: new ol.source.OSM()
      })
    ],
    view: new ol.View({
      center: ol.proj.fromLonLat([2.2137, 46.2276]),
      zoom: 5
    })
  });



  var shopIconStyle = new ol.style.Style({
    image: new ol.style.Icon({
      anchor: [0.5, 1],
      src: window.shopMarkerPath,
      scale: 0.08
    })
  });

  console.log(shopIconStyle)

  var eventIconStyle = new ol.style.Style({
    image: new ol.style.Icon({
      anchor: [0.5, 1],
      src: window.eventMarkerPath,
      scale: 0.08
    })
  });

  function createLayer(markers, style) {
    var features = markers.map(function(marker) {
      var feature = new ol.Feature({
        geometry: new ol.geom.Point(ol.proj.fromLonLat([marker.lon, marker.lat])),
        name: marker.name,
        address: marker.address,
        city: marker.city,
        state: marker.state,
        zip_code: marker.zip_code,
        phone_number: marker.phone_number,
        email: marker.email,
        description: marker.description,
        start: marker.start,
        end: marker.end,
        localisation: marker.localisation
      });
      feature.setStyle(style);
      return feature;
    });
    return new ol.layer.Vector({
      source: new ol.source.Vector({
        features: features
      })
    });
  }

  var shopLayer = createLayer(shopMarkers, shopIconStyle);
  var eventLayer = createLayer(eventMarkers, eventIconStyle);

  var container = document.createElement('div');
  container.className = 'ol-popup card shadow';
  var content = document.createElement('div');
  content.className = 'card-body';
  container.appendChild(content);
  var closer = document.createElement('button');
  closer.className = 'close';
  closer.innerHTML = '&times;';
  container.appendChild(closer);

  var overlay = new ol.Overlay({
    element: container,
    autoPan: true,
    autoPanAnimation: {
      duration: 250
    }
  });
  map.addOverlay(overlay);

  closer.onclick = function() {
    overlay.setPosition(undefined);
    closer.blur();
    return false;
  };

  function displayPopup(feature) {
    content.innerHTML = `
      <div class="card" style="width: 18rem;">
        <div class="card-header bg-primary text-white">
          <h5 class="card-title mb-0">${feature.get('name')}</h5>
        </div>
        <div class="card-body">
          ${feature.get('address') ? `<h6 class="card-subtitle mb-2 text-muted">${feature.get('address')}</h6>` : ''}
          ${feature.get('city') ? `<p class="card-text"><i class="fa fa-map-marker-alt"></i> ${feature.get('city')}, ${feature.get('state')} ${feature.get('zip_code')}</p>` : ''}
          ${feature.get('phone_number') ? `<p class="card-text"><i class="fa fa-phone"></i> <strong>${feature.get('phone_number')}</strong></p>` : ''}
          ${feature.get('email') ? `<p class="card-text"><i class="fa fa-envelope"></i> <a href="mailto:${feature.get('email')}" class="card-link">${feature.get('email')}</a></p>` : ''}
          ${feature.get('description') ? `<p class="card-text">${feature.get('description')}</p>` : ''}
          ${feature.get('start') ? `<p class="card-text"><i class="fa fa-calendar-alt"></i> ${new Date(feature.get('start')).toLocaleDateString()} - ${new Date(feature.get('end')).toLocaleDateString()}</p>` : ''}
          ${feature.get('localisation') ? `<p class="card-text"><i class="fa fa-map-marker-alt"></i> ${feature.get('localisation')}</p>` : ''}
        </div>
      </div>
    `;
    overlay.setPosition(feature.getGeometry().getCoordinates());
  }

  document.getElementById('show-shops').addEventListener('click', function() {
    map.getLayers().getArray().forEach(function(layer) {
      if (layer instanceof ol.layer.Vector) {
        map.removeLayer(layer);
      }
    });
    map.addLayer(shopLayer);
    var listing = document.getElementById('listing');
    listing.innerHTML = shopMarkers.map(function(marker) {
      return `
              <div class="card mb-2 shadow-sm border-0 hover-shadow">
                  <div class="card-body">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                      <h5 class="card-title mb-0" style="color: #D65830;">${marker.name}</h5>
                      <a href="mailto:${marker.email}" class="card-link">
                          <i class="fas fa-envelope" style="color: #2A9D8F;"></i>
                          Contacter la boutique
                      </a>
                      </div>
                      <h6 class="card-subtitle mb-2 text-muted">${marker.address}</h6>
                      <p class="card-text mb-1">
                      <i class="fas fa-map-marker-alt me-1" style="color: #2A9D8F;"></i>${marker.city}, ${marker.state} ${marker.zip_code}
                      </p>
                      <p class="card-text mb-0">
                      <i class="fas fa-phone me-1" style="color: #2A9D8F;"></i><strong>${marker.phone_number}</strong>
                      </p>
                  </div>
              </div>
              <style>
                  .hover-shadow:hover {
                      transform: scale(1.05);
                      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                      transition: transform 0.2s, box-shadow 0.2s;
                  }
              </style>
      `;
    }).join('');
  });

  document.getElementById('show-events').addEventListener('click', function() {
    map.getLayers().getArray().forEach(function(layer) {
      if (layer instanceof ol.layer.Vector) {
        map.removeLayer(layer);
      }
    });
    map.addLayer(eventLayer);
    var listing = document.getElementById('listing');
    listing.innerHTML = eventMarkers.map(function(marker) {
      return `
          <div class="card mb-2 shadow-sm border-0 hover-shadow">
              <a href="/events/${marker.id}" class="text-decoration-none text-dark">
                  <div class="card-body">
                  <h5 class="card-title mb-3" style="color: #D65830;">${marker.name}</h5>
                  <p class="card-text mb-2">
                      <i class="fas fa-info-circle me-2" style="color: #2A9D8F;"></i>${marker.description}
                  </p>
                  <p class="card-text mb-2">
                      <i class="fas fa-calendar-alt me-2" style="color: #2A9D8F;"></i>${new Date(marker.start).toLocaleDateString()} - ${new Date(marker.end).toLocaleDateString()}
                  </p>
                  <p class="card-text">
                      <i class="fas fa-map-marker-alt me-2" style="color: #2A9D8F;"></i>${marker.localisation}
                  </p>
                  </div>
              </a>
          </div>
          <style>
              .hover-shadow:hover {
                  transform: scale(1.05);
                  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                  transition: transform 0.2s, box-shadow 0.2s;
              }
          </style>
      `;
    }).join('');
  });

  map.on('click', function(evt) {
    var feature = map.forEachFeatureAtPixel(evt.pixel, function(feature) {
      return feature;
    });

    if (feature) {
      displayPopup(feature);
    } else {
      overlay.setPosition(undefined);
      closer.blur();
    }
  });
  document.getElementById('show-shops').click();
});


