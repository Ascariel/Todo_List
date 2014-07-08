module TodoListHelpers
	def visit_todo_list(list)
		visit "/todo_lists"
		within dom_id_for(list) do  #THIS DOM_ID_METHOD CAME FROM MY SUPPORT VIEW HELPERS
			click_link("List Items")
		end
	end
end