class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: { message: 'You must fill in the food name' }

  def calc_value(quantity, price)
    quantity * price
  end
end
