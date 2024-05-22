class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  validates :time, presence: true, numericality: { only_integer: true }
end
