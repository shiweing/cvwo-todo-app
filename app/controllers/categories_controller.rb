class CategoriesController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @category_new = Category.new
    @todos = @category.todos.all
    @todo_new = Todo.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    if(category_params[:name].blank?)
      flash[:error] = "Please enter the category title."
    else
      @category = Category.new(category_params)
      if @category.save
        flash[:success] = "Category was created."
      else
        flash[:error] = "Category could not be created."
      end
    end

    redirect_back fallback_location: root_path
  end

  def update
    @category = Category.find(params[:id])
    
    if @category.update(category_params)
      flash[:success] = "Category was updated."
    else
      flash[:error] = "Category could not be updated."
    end

    redirect_back fallback_location: root_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.todos.update_all(category_id: 1);
    
    if @category.destroy
      flash[:success] = "Category was deleted."
    else
      flash[:error] = "Category could not be deleted."
    end

    redirect_back fallback_location: root_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
