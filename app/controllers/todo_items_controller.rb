class TodoItemsController < ApplicationController
  def index
  	@todo_list = TodoList.find(params[:todo_list_id])
  	@todo_items = @todo_list.todo_items
  end

  def new
  	@todo_list = TodoList.find(params[:todo_list_id])
  	@todo_item = @todo_list.todo_items.new
    end

    def create
    	@todo_list = TodoList.find(params[:todo_list_id])
    	@todo_item = @todo_list.todo_items.create(todo_item_params) #CALLING STRONG PARAMS METHDO(PRIVATE)

    	if @todo_item.save
    		
    		flash[:success] = "Your item has been added successfully"
    		redirect_to todo_list_todo_items_path @todo_list
    	else
    		flash[:error] = "There has been an error, please try again"
    	end
    end


    private

    def todo_item_params
    	params[:todo_item].permit(:content)
    end	

end
