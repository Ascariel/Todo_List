require 'spec_helper'


describe "testing list item creation" do 
	let!(:todo_list) {TodoList.create(title: "Grocery List", description: "Something to do")}

	def visit_todo_list(list)
		visit "/todo_lists"
		within("#todo_list_#{list.id}") do
			click_link("List Items")
		end
	end

	it "is succesful with valid content" do 

		visit_todo_list(todo_list)
		click_link("New Todo Item")
		fill_in "Content", with: "Milk"
		click_button("Add to list")

		expect(page).to have_content("Your item has been added successfully")
		within("ul.todo_items") do

			expect(page).to have_content("Milk")
		end

	end

end