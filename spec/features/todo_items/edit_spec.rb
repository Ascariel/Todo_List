
require 'spec_helper'


describe "Tests editing actions" do

	let!(:todo_list) {TodoList.create(title: "Grocery List", description: "Something to do")}
	let!(:todo_item) {todo_list.todo_items.create(content:"Milk")}

	

	it "succesfully displays content when editing" do 

			visit_todo_list(todo_list)

			within("#todo_item_#{todo_item.id}") do 
				click_link("Edit")
			end

			fill_in "Content", with: "Lots of Milk"
			click_button "Save" #CAN BE USED WITH OUR WITHOUT PARENTHESIS

			
			todo_item.reload #OTHERWISE DB DOESNT UPDATE IN TIME TO REFLECT THE CHANGES

			expect(page).to have_content("Saved todo list item")
			expect(todo_item.content).to eq("Lots of Milk")
	end 

	it "it fails when theres not enough content" do
		visit_todo_list(todo_list)
		within("#todo_item_#{todo_item.id}") do
			click_link("Edit")
		end

		fill_in "Content", with: ""
		click_button "Save"

		todo_item.reload
		expect(page).to_not have_content("Saved todo list item")
		expect(page).to have_content("Content can't be blank")
		expect(todo_item.content).to eq("Milk")

	end

	it "it fails when theres not enough content" do
		visit_todo_list(todo_list)
		within("#todo_item_#{todo_item.id}") do
			click_link("Edit")
		end

		fill_in "Content", with: "1"
		click_button "Save"

		todo_item.reload
		expect(page).to_not have_content("Saved todo list item")
		expect(page).to have_content("Content is too short")
		expect(todo_item.content).to eq("Milk")
	end


end