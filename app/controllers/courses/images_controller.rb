class Courses::ImagesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_course

  def destroy
    @course.course_image.purge_later
    respond_to do |format|
      format.html { redirect_to edit_course_path(@course) }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@course, :course_image)) }
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end
end
