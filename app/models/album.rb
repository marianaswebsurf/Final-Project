class Album < ApplicationRecord
  belongs_to :band, optional: true

  has_many_attached :images
end
