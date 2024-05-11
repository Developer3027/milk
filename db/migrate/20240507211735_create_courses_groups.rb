class CreateCoursesGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :courses_groups do |t|
      t.belongs_to :group
      t.belongs_to :course

      t.timestamps
    end
  end
end
