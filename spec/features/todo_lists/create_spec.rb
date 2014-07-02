require 'spec_helper'

describe "creating todo lists" do 

	def create_todo_list(options={})

		options[:title] ||= "My todo list"
		options[:description] ||= "Something to do"

		visit "/todo_lists"
		click_link 'New Todo list'
		expect(page).to have_content("New todo_list")


		fill_in 'Title', with: options[:title]
		fill_in 'Description', with: options[:description]
		click_button "Create Todo list"
	end

	it 'redirects to the todo list index page on success' do

		create_todo_list

		expect(page).to have_content("My todo list")
	end


	it "displays an error when the todo list has no Title" do 
		
		expect(TodoList.count).to eq(0)

		create_todo_list(title:"")



		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Something to do")
	end


		it "displays an error when the todo list has a Title title with less than 3 chars" do 
		
		expect(TodoList.count).to eq(0)

		create_todo_list title: "Hi"



		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Hi")
	end


		it "displays an error when the todo list does not have a Description" do 
		
		expect(TodoList.count).to eq(0)

		create_todo_list description: ''



		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("My todo list")
	end

	it "displays an error if description has less than 5 chars" do
		#Navigates to new list creation site

		create_todo_list description: "abcd"
		
		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit("/todo_lists")
		expect(page).to_not have_content("abcd")
	end



end