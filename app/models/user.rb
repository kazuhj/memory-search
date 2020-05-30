class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :contents
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :name, length: { maximum: 10 }
  validates :text, length: { maximum: 300 }
end
