class Category < ApplicationRecord
  belongs_to :user
  has_many :recipes
  validates_presence_of :name
end
