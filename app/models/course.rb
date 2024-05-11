class Course < ApplicationRecord
  has_rich_text :description
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  has_many :lessons
  has_and_belongs_to_many :groups

    # Returns the first lesson in the course.
    #
    # @return [Lesson] the first lesson in the course
  def first_lesson
    self.lessons.order(:position).first
  end

  def vid_key
    lessons.first&.key
  end
end
