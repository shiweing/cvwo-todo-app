class TodosController < ApplicationController
  # def show
  #   @todo = Todo.find(params[:id])
  # end

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(todo_params)
    redirect_to todos_path
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path, notice: "*Delete success"
  end

  def edit
    @todo = Todo.find_by(params[:id])
  end

  def update
    @todo = Todo.find_by(params[:id])
    @todo.update(todo_params)
    redirect_to todos_path
  end
  
  private
  def todo_params
    params.require(:todo).permit(:item, :category)
  end

end
