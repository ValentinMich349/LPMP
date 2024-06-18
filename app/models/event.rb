class Event < ApplicationRecord
    has_one_attached :image
    belongs_to :city

    def self.ransackable_attributes(auth_object = nil)
        ["name", "description", "price", "start", "end", "localisation", "image_url", "city_id", "created_at", "updated_at"]
      end

      def self.ransackable_associations(auth_object = nil)
        ["city", "image_attachment", "image_blob"]
      end
    
end
