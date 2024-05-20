# Controller for maanaging courses through the admin panel
# Admin::CoursesController
class Admin
  # Course Controller for managing courses via admin
  class CoursesController < AdminController
    # Retrieves all courses for the admin interface.
    def index
      @admin_courses = Course.all
    end

    # Retrieves and assigns the admin course based on the provided ID.
    def show
      @admin_course = Course.find(params[:id])
    end

    # Creates a new admin course object and assigns it to the instance variable @admin_course.
    def new
      @admin_course = Course.new
    end

    # Create a new admin course object and saves it. Redirect to admin courses path on success, else render new template
    def create
      @admin_course = Course.new(course_params)

      if @admin_course.save
        redirect_to admin_courses_path
      else
        render :new
      end
    end

    # Retrieves and assigns the admin course for editing based on the provided ID.
    def edit
      @admin_course = Course.find(params[:id])
    end

    # Update admin course by ID using the params in course_params. Redirects to admin_courses_path or edit template.
    def update
      @admin_course = Course.find(params[:id])

      if @admin_course.update(course_params)
        redirect_to admin_courses_path
      else
        render :edit
      end
    end

    private

    # Permits the specified parameters for the course object.
    def course_params
      params.require(:course).permit(:title, :description, :premium_description, :paid, :stripe_price_id, :image)
    end
  end
end
