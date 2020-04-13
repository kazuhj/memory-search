class Content < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :title, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
