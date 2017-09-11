class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :directions

 accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

 accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

 validates :name, presence: true
end