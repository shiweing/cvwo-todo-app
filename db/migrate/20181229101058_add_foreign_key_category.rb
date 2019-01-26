class AddForeignKeyCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :todos, :category, foreign_key: true
  end
end
