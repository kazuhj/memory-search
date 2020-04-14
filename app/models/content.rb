class Content < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader

  validates :title, presence: true, unless: :image?
  validates :title, length: { maximum: 40 }
  validates :text, presence: true
  validates :text, length: { maximum: 1000 }
  validates :image, presence: true

  def self.search(search)
    return Content.all unless search
    Content.where(['title LIKE ? OR text LIKE ? OR @user.name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
  end
end
