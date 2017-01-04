class Placement < ApplicationRecord
  validates :title, :photos, :price, :address, presence: true
  validates :title, :address, uniqueness: true

  default_scope { order(created_at: :desc) }

  mount_uploaders :photos, PlacementPhotoUploader

  has_many :reviews, dependent: :destroy
end
