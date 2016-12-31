class Placement < ApplicationRecord
  validates :title, :photos, :price, :address, presence: true
  validates :title, :address, uniqueness: true

  mount_uploaders :photos, PlacementPhotoUploader
end
