class ChangeTodosTable < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :description, :string
    add_column :todos, :completed_at, :datetime
  end
end
