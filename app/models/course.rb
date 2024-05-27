class Course < ApplicationRecord
  has_rich_text :description
  has_one_attached :course_image
  has_many :lessons
  has_and_belongs_to_many :groups

  # Returns the first lesson in the course.
  #
  # @return [Lesson] the first lesson in the course
  def first_lesson
    lessons.order(:position).first
  end

  def next_lesson(current_user)
    return lessons.order(:position).first if current_user.blank?

    completed_lessons = current_user.lesson_users.includes(:lesson).where(completed: true).where(lessons: { course_id: id })

    started_lessons = current_user.lesson_users.includes(:lesson).where(completed: false).where(lessons: { course_id: id }).order(:position)

    return started_lessons.first.lesson if started_lessons.any?

    lessons = self.lessons.where.not(id: completed_lessons.pluck(:lesson_id)).order(:position)
    return self.lessons.order(:position).first unless lessons.any?

    lessons.first
  end

  def vid_key
    lessons.first&.key
  end
end
