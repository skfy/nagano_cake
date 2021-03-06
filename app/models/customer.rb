class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save { self.email.downcase! }

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  def is_valid
    self.is_active == true
  end
  #enum is_active: { effectiveness: true, withdrawal: false }

end
