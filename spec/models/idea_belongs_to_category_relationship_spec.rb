require 'rails_helper'

RSpec.describe Idea, type: :model do
  
  let(:category) do 
    Category.create(theme: "Future Plans")
  end
  let(:idea) do 
    Idea.create(title: "Dream", body: "TEXT", category_id: category.id)
  end

  it "has a relationship with category" do
    expect(idea.category.theme).to eq('Future Plans')
  end
  
end