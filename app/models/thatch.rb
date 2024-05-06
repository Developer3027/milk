class Thatch < ApplicationRecord
  has_one_attached :album_art
  has_one_attached :song

  belongs_to :user
end
