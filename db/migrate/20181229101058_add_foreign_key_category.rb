class AddForeignKeyCategory < ActiveRecord::Migration[5.2]
  def change
    change_column :todos, :category, :integer
    add_reference :todos, :category, foreign_key: true
  end
end
