class Idea < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :title, :body, presence: true
end
