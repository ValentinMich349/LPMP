class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :wishlist_items
  has_many :events
  has_one :wishlist, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reviewed_products, through: :reviews, source: :product
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :create_cart      
  after_create :send_welcome_email, unless: -> { defined?($is_seeding) && $is_seeding }

  def send_welcome_email
   UserMailer.welcome_email(self).deliver_later
  end

  def self.ransackable_associations(auth_object = nil)
    %w[cart orders]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[email first_name last_name pseudo admin created_at updated_at]
  end

  def admin?
    self.admin
  end

  private

  def create_cart
    self.create_cart!
  end
end
