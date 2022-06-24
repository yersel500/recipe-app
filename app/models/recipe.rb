class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :delete_all
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :public, inclusion: [true, false]
end
