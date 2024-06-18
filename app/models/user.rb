class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :wishlist_items
  has_one :wishlist, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :send_welcome_email

  def send_welcome_email
     # Logic to send welcome email, e.g.:
   UserMailer.welcome_email(self).deliver_now
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
end
