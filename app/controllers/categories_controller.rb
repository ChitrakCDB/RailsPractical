class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category= Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice]="Successfuly Performed Update!"
      
      redirect_to categories_path(@category)
    else
      flash[:errors]=@category.errors.full_messages
      redirect_to edit_category_path(@category)
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice]="Successfuly Performed delete!"
      redirect_to categories_path
    else  
      flash[:errors]=@category.errors.full_messages
      redirect_to new_category_path
    end
  end

  def create
    @category= Category.create(category_params)
    if @category.valid?
      flash[:notice]="Successfuly Performed create!"
      redirect_to categories_path
    else 
      flash[:errors]=@category.errors.full_messages
      redirect_to new_category_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :myuser_id)
  end
end
