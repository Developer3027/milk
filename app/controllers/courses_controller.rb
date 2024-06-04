# Course Controller for general and user specific actions
class CoursesController < ApplicationController
  # Set the @course instance variable to the Course object corresponding to the provided ID from the params,
  # make it available to all actions in the controller
  before_action :set_course, only: %i[show edit update destroy]
  # Set the @user_started_courses instance variable to the course IDs of the courses the user has started
  before_action :user_course
  # Calculate the progress of each course for the current user,
  # return it in the @user_course_progresses instance variable
  before_action :user_progress

  # GET /courses or /courses.json
  #
  # Retrieves all Course objects from the database and assigns them to the @courses
  # instance variable. The courses are ordered by their IDs in ascending order.
  #
  # @return [void]
  def index
    # Retrieve all courses from the database
    # and order them by their IDs in ascending order
    @courses = Course.all.order(id: :asc)
  end

  # GET /courses/1 or /courses/1.json
  #
  # Retrieves the course object corresponding to the provided ID from the params and sets it as the
  # @course instance variable. It then retrieves the IDs of the lessons that the current user has
  # completed for the current course and sets them as the @completed_lessons instance variable.
  #
  # @return [void]
  def show
    # Retrieve the IDs of the lessons that the current user has completed for the current course
    @completed_lessons = current_user&.lesson_users&.joins(
      :lesson)&.where(completed: true, lesson: {course: @course})&.pluck(:lesson_id)

    @course = Course.includes(:lessons).find(params[:id])
    render json: @course, include: :lessons
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # POST /courses or /courses.json
  #
  # Creates a new Course object with the parameters provided in the request and saves it to the database.
  #
  # @return [void]
  def create
    # Create a new Course object with the parameters provided in the request
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        # If the course is successfully saved, redirect to the course's show page
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        # If the course is successfully saved, render the show template for the course
        format.json { render :show, status: :created, location: @course }
      else
        # If the course fails to save, render the new template with the error messages
        format.html { render :new, status: :unprocessable_entity }
        # If the course fails to save, render the error messages as JSON
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  #
  # Updates the specified course in the database with the attributes provided in the request.
  #
  # @return [void]
  # rubocop:disable Metrics/MethodLength
  def update
    respond_to do |format|
      if @course.update(course_params) # Update the course with the specified attributes
        # Redirect to the course's show page with a success message
        format.html do
          redirect_to course_url(@course), notice: "Course was successfully updated."
        end
        format.json { render :show, status: :ok, location: @course } # Render the show template for the course
      else
        format.html { render :edit, status: :unprocessable_entity } # Render the edit template with error messages
        format.json { render json: @course.errors, status: :unprocessable_entity } # Render the error messages as JSON
      end
    end
    # rubocop:enable Metrics/MethodLength
  end

  # DELETE /courses/1 or /courses/1.json
  #
  # Destroys the specified course from the database.
  #
  # @return [void]
  def destroy
    @course.destroy! # Destroy the course from the database

    respond_to do |format|
      # Redirect to the courses index page with a success message
      format.html do
        redirect_to courses_url, notice: "Course was successfully destroyed."
      end
      format.json { head :no_content } # Return no content as the response
    end
  end

  private

  # Sets the @course instance variable to the Course object corresponding to the
  # provided ID from the params.
  #
  # This method is used as a before_action in the CoursesController to set the
  # @course instance variable for actions that need to work with a specific course.
  #
  # @return [Course] the Course object corresponding to the provided ID from the params
  def set_course
    # Find the Course object with the given ID from the params and assign it to the
    # @course instance variable.
    @course = Course.find(params[:id])
  end

  # Retrieves the course IDs of the courses the user has started.
  #
  # This method checks if the instance variable @user_started_courses is already
  # present. If it is present, it returns the existing value. Otherwise, it
  # queries the database to get the course IDs of the courses the user has started.
  # The method uses the current_user object to retrieve the lesson users of the
  # current user and joins them with the lessons table. It then retrieves the course
  # IDs of the lessons and returns them as an array of unique course IDs.
  #
  # @return [Array] An array of unique course IDs of the courses the user has started.
  def user_course
    if @user_started_courses.present?
      @user_started_courses # Return the existing value if the instance variable is present
    else
      @user_started_courses = current_user&.lesson_users&.joins(:lesson)&.pluck(:course_id)&.uniq
    end
  end

  # Calculates the progress of each course for the current user.
  #
  # This method retrieves the course IDs of the courses the user has started. It then
  # queries the database to get the total number of lessons for each course and the
  # number of completed lessons for each course. The method calculates the completion
  # percentage for each course and stores the results in the `@user_course_progresses`
  # instance variable.
  #
  # Returns:
  # - An array of hashes, where each hash represents the progress of a course.
  #   - The hash has the following keys:
  #     - `:course_id`: The ID of the course.
  #     - `:completed_percentage`: The completion percentage of the course (an integer
  #       value between 0 and 100).
  def user_progress
    course_ids = @user_started_courses
    lesson_users = current_user&.lesson_users&.includes(:lesson)

    @user_course_progresses = course_ids.map do |course_id|
      course_lessons = Course.find(course_id).lessons.count
      completed_lessons = lesson_users&.where(completed: true, lesson: {course: course_id})&.count || 0

      {course_id:, completed_percentage: ((completed_lessons / course_lessons.to_f) * 100).to_i}
    end
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:course_image, :title, :subtitle, :description)
  end
end
