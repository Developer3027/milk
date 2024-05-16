class Admin::CoursesController < ApplicationController
  # Retrieves all courses from the database.
  def index
    @admin_courses = Course.all
  end

  def new
    @admin_course = Course.new
  end
end
