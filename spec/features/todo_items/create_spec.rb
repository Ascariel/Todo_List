require 'spec_helper'


describe "testing list item creation" do 
	let!(:todo_list) {TodoList.create(title: "Grocery List", description: "Something to do")}
	# let!(:todo_item) {todo_list.todo_items.create(content:"Milk")}

	

	it "is succesful with valid content" do 

		visit_todo_list(todo_list)
		click_link("New Todo Item")
		fill_in "Content", with: "Milk"
		click_button("Save")

		expect(page).to have_content("Your item has been added successfully")
		within("ul.todo_items") do

			expect(page).to have_content("Milk")
		end
	end

	it "displays error when theres no content" do 

		visit_todo_list(todo_list)

		click_link("New Todo Item")
		fill_in "Content", with: ""
		click_button("Save")
		

		within("div.alert") do

			expect(page).to have_content("There has been an error, please try again")
		end

		expect(page).to have_content("Content can't be blank")
		

	end

	it "displays error with content shorter than 2 chars" do 

		visit_todo_list(todo_list)
		click_link("New Todo Item")
		fill_in "Content", with: "1"
		click_button("Save")

		within("div.alert") do
			expect(page).to have_content("There has been an error, please try again")
		end

		expect(page).to have_content("Content is too short ")
	end	

	

end