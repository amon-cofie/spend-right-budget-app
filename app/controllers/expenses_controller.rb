class ExpensesController < ApplicationController
    def index
        @expenses = CategoryExpense.includes(:expense).where(category_id: params[:category_id])
        @total_amount = @expenses.map{|exp| exp.expense.amount}.sum
        @category = params[:category_id]
    end

    def new
        @expense = Expense.new
        @category = params[:category_id]
    end

    def create
        @new_expense = Expense.new(expense_params)
        @new_expense.user_id = current_user.id
        @new_category_expense = CategoryExpense.new
        @new_category_expense.category_id = params[:category_id]
        @new_category_expense.expense_id = @new_expense.id

        if @new_category_expense.save
            redirect_to category_expenses_path(params[:category_id]) if @new_expense.save
        else
            render :new
        end
    end

    private

    def expense_params
        params.require(:expense).permit(:name, :amount)    
    end
end
