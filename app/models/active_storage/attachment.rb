class ActiveStorage::Attachment < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
      ["blob_id", "created_at", "id", "id_value", "name", "record_id", "record_type"]
    end
  end