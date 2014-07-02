require 'spec_helper'

describe "creating todo lists" do 

	it 'redirects to the todo list index page on success' do
		visit "/todo_lists"
		click_link 'New Todo list'
		expect(page).to have_content("New todo_list")


		fill_in 'Title', with: 'My todo list'
		fill_in 'Description', with: "This is what i'm dong today."
		click_button "Create Todo list"

		expect(page).to have_content("My todo list")
	end


	it "displays an error when the todo list has no Title" do 
		
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link 'New Todo list'
		expect(page).to have_content("New todo_list")


		fill_in 'Title', with: ''
		fill_in 'Description', with: "This is what i'm dong today."
		click_button "Create Todo list"



		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is what i'm dong today.")
	end


		it "displays an error when the todo list has a Title title with less than 3 chars" do 
		
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link 'New Todo list'
		expect(page).to have_content("New todo_list")


		fill_in 'Title', with: 'Hi'
		fill_in 'Description', with: "This is what i'm dong today."
		click_button "Create Todo list"



		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is what i'm dong today.")
	end


		it "displays an error when the todo list does not have a Description" do 
		
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link 'New Todo list'
		expect(page).to have_content("New todo_list")


		fill_in 'Title', with: 'Grocery list'
		fill_in 'Description', with: ""
		click_button "Create Todo list"



		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Grocery list")
	end

	it "displays an error if description has less than 5 chars" do
		#Navigates to new list creation site
		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "Grocery list"
		fill_in "Description", with: "1234"
		click_button "Create Todo list"
		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit("/todo_lists")
		expect(page).to_not have_content("My Grocery list")
	end



end