require 'spec_helper'

describe "editing todo lists" do 

	let!(:todo_list) {TodoList.create(title: "Grocery list", description: "Things to do")} 
	#defines the :todo_list var before every test, making it available.

	def update_list(options={})

			options[:title] ||= "Grocery list"
			options[:description] ||= "Things to do"

			todo_list = options[:todo_list] 

			visit "/todo_lists"

			within "#todo_list_#{todo_list.id}" do
				click_link "Edit"
			end

			fill_in "Title", with: options[:title]
			fill_in "Description", with: options[:description]
			click_button "Update Todo list"

			

	end

	it "updates a todo list succesfully with correct information" do 

		update_list(todo_list: todo_list,
					title: "New title", 
					description: "New description")

		todo_list.reload

		expect(page).to have_content("Todo list was successfully updated.")
		expect(todo_list.title).to eq("New title")
		expect(todo_list.description).to eq("New description")
	end

	it "displays error when title is empty" do

		update_list todo_list: todo_list, 
					title: "", 
					description: "Some description"
		
		title = todo_list.title
		todo_list.reload
		
		expect(todo_list.title).to eq(title)
		expect(page).to have_content("error")
	end

	it "displays error whith title shorter tha 3 chars" do 
		update_list todo_list: todo_list, title: "hi", description: "Some description"
		expect(page).to have_content("error")
	end

		it "displays error when description is empty" do
		update_list todo_list: todo_list, title: "Some title", description: ""
		expect(page).to have_content("error")
	end
	
	it "displays error whith description shorter tha 3 chars" do 
		update_list todo_list: todo_list, title: "Some title", description: "no"
		expect(page).to have_content("error")
	end

end



