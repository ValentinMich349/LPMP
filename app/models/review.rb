class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, uniqueness: { scope: :product_id, message: "Vous avez déjà laissé un avis pour ce produit" }
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true
end
