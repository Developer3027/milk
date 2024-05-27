# Description / model of lesson class
class Lesson < ApplicationRecord
  # video file set up for future use
  has_one_attached :video

  # cover image for lesson when needed
  has_one_attached :lesson_image

  # description is action text
  has_rich_text :description

  # each lesson is associated with a course
  belongs_to :course

  # lesson_users table keeps track of users who have completed the lesson
  # if user removed then tracking is removed
  has_many :lessson_users, dependent: :destroy
end
