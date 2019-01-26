class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :item
      t.string :description
      t.datetime :completed_at

      t.timestamps
    end
  end
end
