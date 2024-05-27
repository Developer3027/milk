class AddColumnToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :provider, :string
  end
end
