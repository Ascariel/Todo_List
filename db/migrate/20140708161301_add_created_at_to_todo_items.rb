class AddCreatedAtToTodoItems < ActiveRecord::Migration
  def change
  	add_column :todo_items, :completed_at, :date_time
  end
end
