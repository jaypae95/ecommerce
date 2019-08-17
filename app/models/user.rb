class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates_uniqueness_of :u_id
   validates_uniqueness_of :contact

  has_many :wishlists
  has_many :orders

end
