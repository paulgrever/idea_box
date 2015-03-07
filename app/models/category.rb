class Category < ActiveRecord::Base
  has_many :ideas
  validates :theme, presence: true, uniqueness: true
end
