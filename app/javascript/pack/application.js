import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();


// Optionally include jQuery
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