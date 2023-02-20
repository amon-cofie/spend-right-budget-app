class Category < ApplicationRecord
  belongs_to :user
  has_many :category_expenses
  has_many :expenses, through: :category_expenses
end
