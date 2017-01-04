class Placement < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :reviews, dependent: :destroy

  validates :title, :photos, :price, :address, presence: true
  validates :title, :address, uniqueness: true

  mount_uploaders :photos, PlacementPhotoUploader

  def self.search(title)
    where('title LIKE ?', "%#{title}%")
  end
end
