class DeleteCategoryId < ActiveRecord::Migration[5.2]
  def change
    remove_column :todos, :category, :integer
  end
end
