class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :item
      t.string :category

      t.timestamps
    end
  end
end
