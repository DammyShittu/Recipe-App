class Recipe < ApplicationRecord
  validates :name, presence: true

  has_many :recipe_foods, dependent: :destroy
  belongs_to :user
end
