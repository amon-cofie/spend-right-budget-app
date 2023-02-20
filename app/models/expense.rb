class Expense < ApplicationRecord
  belongs_to :user
  has_many :category_expenses
  has_many :categories, through: :category_expenses
end
