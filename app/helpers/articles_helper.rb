module ArticlesHelper
    def article_jsonld(article)
        {
          "@context": "http://schema.org",
          "@type": "Article",
          "headline": article.title,
          "author": {
            "@type": "Person",
            "name": article.author.name
          },
          "datePublished": article.published_at.strftime("%Y-%m-%d"),
          "description": article.summary,
          "mainEntityOfPage": article_url(article),
          "image": article.image_url
        }.to_json.html_safe
      end
end
