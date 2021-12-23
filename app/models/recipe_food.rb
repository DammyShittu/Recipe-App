class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def calc_value(quantity, price)
    quantity * price
  end
end
