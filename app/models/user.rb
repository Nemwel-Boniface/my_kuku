class User < ApplicationRecord
  # validations
  validates :names, presence: true, length: { minimum: 1, maximum: 50 }
  validates :email, presence: true
  validates :profile_photo, presence: true
  validates :role, presence: true
  validates :blogs_counter, presence: true, numericality: { only_integer: true }
  validates :mobile_number, presence: true, length: { is: 9 }, numericality: { only_integer: true }
  validates :status, presence: true
  validates :location, presence: true

  # associations

  has_one_attached :profile_photo
  has_many :blogs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
