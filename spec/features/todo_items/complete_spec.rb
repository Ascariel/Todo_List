



# require 'spec_helper'


# describe "Completing todo items " do

# 	let!(:todo_list) {TodoList.create(title: "Grocery List", description: "Something to do")}
# 	let!(:todo_item) {todo_list.todo_items.create(content:"Milk")}

# 	it "is successful when marking an item complete" do 

# 		visit_todo_list(todo_list)
# 		expect(todo_item.completed_at).to be_nil
		

# 		# within dom_id_for(todo_item) do
# 		# 	click_link "Mark Complete"
# 		# end
# 		# todo_item.reload
# 		# expect(todo_item.completed_at).to_not be_nil
# 	end
# end


# 	