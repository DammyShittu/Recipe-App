class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :cooking_time, presence: { message: 'You must fill in the cooking_time' }
  validates :description, presence: { message: 'You must fill in the description' }
  validates :preparation_time, presence: { message: 'You must fill in the preparation_time' }

  has_many :recipe_foods, dependent: :destroy
  belongs_to :user

  def total
    recipe_foods.joins(:recipe, :food).sum('price * quantity')
  end

  def total_items
    recipe_foods.sum(:quantity)
  end
end
