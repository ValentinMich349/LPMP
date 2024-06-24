module ProductsHelper
    def product_jsonld(product)
      {
        "@context": "http://schema.org",
        "@type": "Product",
        "name": product.name,
        "image": product.image_url,
        "description": product.description,
        "sku": product.sku,
        "offers": {
          "@type": "Offer",
          "url": product_url(product),
          "priceCurrency": "USD",
          "price": product.price,
          "itemCondition": "http://schema.org/NewCondition",
          "availability": "http://schema.org/InStock"
        }
      }.to_json.html_safe
    end
  end
  