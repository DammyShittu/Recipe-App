class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: { message: 'You must fill in the quantity value' },
                       numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def calc_value(quantity, price)
    quantity * price
  end
end
