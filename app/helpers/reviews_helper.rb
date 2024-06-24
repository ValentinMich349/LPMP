module ReviewsHelper
    def review_jsonld(review)
        {
          "@context": "http://schema.org",
          "@type": "Review",
          "author": {
            "@type": "Person",
            "name": review.user.name
          },
          "reviewRating": {
            "@type": "Rating",
            "ratingValue": review.rating,
            "bestRating": "5"
          },
          "reviewBody": review.comment,
          "itemReviewed": {
            "@type": "Product",
            "name": review.product.name,
            "image": review.product.image_url
          }
        }.to_json.html_safe
      end
end
