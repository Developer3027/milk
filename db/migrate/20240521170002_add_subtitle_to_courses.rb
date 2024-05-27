class AddSubtitleToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :subtitle, :text
  end
end
