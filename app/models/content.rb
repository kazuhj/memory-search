class Content < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :title, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

  def self.search(search)
    return Content.all unless search
    Content.where(['title LIKE ? OR text LIKE ? OR @user.name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
  end
end
