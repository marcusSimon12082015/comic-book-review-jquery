class Publisher < ApplicationRecord
  has_many :characters
  has_many :comics 
end
