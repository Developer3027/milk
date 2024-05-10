class AddProjectNameToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :project_name, :string
  end
end
