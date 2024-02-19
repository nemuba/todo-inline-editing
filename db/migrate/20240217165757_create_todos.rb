class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_enum :todo_status, %w[completed pending]

    create_table :todos do |t|
      t.string :title
      t.string :description
      t.enum :status, enum_type: :todo_status, default: 'pending'
      t.timestamps
    end

    add_index :todos, :title
    add_index :todos, :description
    add_index :todos, :status
    add_index :todos, :created_at
    add_index :todos, :updated_at
  end
end
