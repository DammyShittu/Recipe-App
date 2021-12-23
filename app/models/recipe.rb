class Recipe < ApplicationRecord
  validates :name, presence: true

  has_many :recipe_foods, dependent: :destroy
  belongs_to :user

  def total
    recipe_foods.joins(:recipe, :food).sum('price * quantity')
  end

  def total_items
    recipe_foods.sum(:quantity)
  end
end
