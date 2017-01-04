class Review < ApplicationRecord
  validates :title, :content, presence: true

  default_scope { order(created_at: :desc) }

  mount_uploaders :photos, ReviewPhotoUploader

  belongs_to :user
  belongs_to :placement

  delegate :name, to: :user, prefix: true
end
