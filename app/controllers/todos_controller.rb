class TodosController < ApplicationController
  # before_action :set_category, only: [:create]
  # before_action :set_todo_item, only: []

  def index
    @todos = Todo.all
    @todo = Todo.new
    @categories = Category.all
    @category_new = Category.new
  end

  def new
    @todo = Todo.new
    session[:return_to] ||= request.referer
  end

  def create
    if(todo_params[:item].blank? && todo_params[:description].blank?)
      flash[:error] = "Please enter the todo item."
    else
      @category = Category.find(todo_params[:category_id])
      @todo = @category.todos.create(todo_params)
      if @todo.save
        flash[:success] = "Todo item was created."
      else
        flash[:error] = "Todo item could not be created."
      end
    end
    
    redirect_back fallback_location: root_path
  end

  def edit
    @todo = Todo.find_by(params[:id])
    @categories = Category.all
    session[:return_to] ||= request.referer
  end

  def update
    @todo = Todo.find_by(params[:id])
    @todo.update(todo_params)
    redirect_to session.delete(:return_to)
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      flash[:success] = "Todo item was deleted."
    else
      flash[:error] = "Todo item could not be deleted."
    end
    redirect_back fallback_location: root_path
  end

  def complete
    @todo = Todo.find_by(params[:id])
    
    if @todo.completed_at.blank? 
      @todo.update_attribute(:completed_at, Time.now)
    else
      @todo.update_attribute(:completed_at, nil)
    end
    redirect_back fallback_location: root_path, notice: "Todo item completed"
  end
  
  private
  # def set_category
  #   @category = Category.find(todo_params[:category_id])
  # end

  # def set_todo
  #   @todo = @category.todos.find(params[:id])
  # end

  def todo_params
    params.require(:todo).permit(:item, :description, :category_id, :completed_at)
  end

end
