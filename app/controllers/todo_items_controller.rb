class TodoItemsController < ApplicationController

  before_action(:find_todo_list)# CAN OMMIT PARENTHESIS
  def index
  	
  	@todo_items = @todo_list.todo_items
  end

  def new

  	@todo_item = @todo_list.todo_items.new
    end

  def create

  	@todo_item = @todo_list.todo_items.create(todo_item_params) #CALLING STRONG PARAMS METHDO(PRIVATE)
  	if @todo_item.save
  		flash[:success] = "Your item has been added successfully"
  		redirect_to todo_list_todo_items_path @todo_list
  	else
  		flash[:error] = "There has been an error, please try again"
      render action: :new
  	end
  end

  def edit

    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def update

      @todo_item = @todo_list.todo_items.find(params[:id])
      if @todo_item.update_attributes(todo_item_params)
        flash[:success] = "Saved todo list item"
        redirect_to todo_list_todo_items_path
      else
        flash[:error] = "That todo item could not be saved"
        render action: :edit
      end
  end

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:success] = "Todo list item was deleted"
    else
      flash[:error] = "Todo list item could not be deleted"
    end
    redirect_to todo_list_todo_items_path
  end


      #I THINK IM MERGING THIS METHOD THAT ALREADY EXISTS 
      # IN MY PARENT CLASS(APPLICATION CONTROLLER, USING SUPER), SO BY DOING THAT IM OVERRRIDING THAT CLASS AND MAKING ALL THE 
      # INFO IM PASSING AVAILABLE TO ALL MY VIES AND CONTROLLERS THKS TO INHERITANCE.
    def url_options

      {todo_list_id: params[:todo_list_id]}.merge(super) #ITS AUTOMATICALLY CALLED EVERYTIME A URL IS GENERATED.
    end


    private

    def find_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def todo_item_params
    	params[:todo_item].permit(:content)
    end	

end
