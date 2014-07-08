class AddCreatedAtToTodoItemsFixedDatetimeColumn < ActiveRecord::Migration
  def change
  	change_table :todo_items do |t|
  		t.change :completed_at, :datetime
 	 end
  end
end
