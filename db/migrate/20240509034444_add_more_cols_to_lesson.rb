class AddMoreColsToLesson < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :key, :string
  end
end
