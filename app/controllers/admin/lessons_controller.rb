# Controller for managing lessons through the admin panel
# Admin::LessonsController <AdminController
class Admin
  # Lesson controller via admin
  class LessonsController < AdminController
    before_action :set_course
    before_action :set_lesson, only: %i[show edit update destroy]
    def index
      @admin_lessons = @admin_course.lessons.order(:position)
    end

    def new
      @admin_lesson = @admin_course.lessons.new
    end

    # method left for reference
    # def show
    # end

    # method left for reference
    # def edit
    # end

    def update
      if @admin_lesson.update(lesson_params)
        redirect_to admin_course_lessons_path(@admin_course)
      else
        render :edit
      end
    end

    def create
      @admin_lesson = @admin_course.lessons.new(lesson_params)

      if @admin_lesson.save
        redirect_to admin_course_lessons_path(@admin_course)
      else
        render :new
      end
    end

    def destroy
      @admin_lesson.destroy!

      redirect_to admin_course_lessons_path(@admin_course)
    end

    private

    def set_course
      @admin_course = Course.find(params[:course_id])
    end

    def set_lesson
      @admin_lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(
        :lesson_image,
        :title,
        :description,
        :provider,
        :key,
        :paid,
        :position
      )
    end
  end
end
