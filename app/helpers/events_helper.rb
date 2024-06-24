module EventsHelper
    def event_jsonld(event)
        {
          "@context": "http://schema.org",
          "@type": "Event",
          "name": event.name,
          "startDate": event.start_time.strftime("%Y-%m-%dT%H:%M:%S"),
          "endDate": event.end_time.strftime("%Y-%m-%dT%H:%M:%S"),
          "location": {
            "@type": "Place",
            "name": event.location_name,
            "address": {
              "@type": "PostalAddress",
              "streetAddress": event.street_address,
              "addressLocality": event.city,
              "addressRegion": event.region,
              "postalCode": event.postal_code,
              "addressCountry": event.country
            }
          },
          "image": event.image_url,
          "description": event.description,
          "offers": {
            "@type": "Offer",
            "url": event_url(event),
            "price": event.price,
            "priceCurrency": "USD",
            "availability": "http://schema.org/InStock",
            "validFrom": event.created_at.strftime("%Y-%m-%dT%H:%M:%S")
          }
        }.to_json.html_safe
      end
end
