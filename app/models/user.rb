class User < ApplicationRecord
 # Include default devise modules. Others available are:
  #:lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  def full_name
    "#{fname} #{lname}"
  end
end
