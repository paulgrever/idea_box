require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) do 
    Category.new(theme: "Future Plans")
  end

  it "exists" do
    expect(category).to be_valid
  end

  it "has a theme" do
    expect(category.theme).to eq("Future Plans")
    
  end

  it "is invalid without a theme" do
    category.theme = nil
    expect(category).to_not be_valid
  end

  it "is invalid with duplicate values" do
    Category.create(theme: "Test_Theme")
    expect(category).to be_valid
    expect(Category.count).to eq(1)
    test_category = Category.new(theme: 'Test_Theme')
    test_category.save
    expect(Category.count).to eq(1)

  end

end
