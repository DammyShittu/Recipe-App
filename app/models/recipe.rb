class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :cooking_time, presence: { message: 'You must fill in the cooking_time' },
                           numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: { message: 'You must fill in the description' }
  validates :preparation_time, presence: { message: 'You must fill in the preparation_time' },
                               numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :recipe_foods, dependent: :destroy
  belongs_to :user
end
