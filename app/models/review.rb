class Review < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user
  belongs_to :placement

  validates :title, :content, presence: true

  delegate :name, to: :user, prefix: true

  mount_uploaders :photos, ReviewPhotoUploader
end
