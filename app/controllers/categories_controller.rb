class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user: current_user)
    @expenses = Expense.where(user: current_user)
    @category_expenses = CategoryExpense.all
  end

  def new
    @category = Category.new
  end

  def create
    @new_category = Category.new(category_params)
    @new_category.user_id = current_user.id
    if @new_category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
