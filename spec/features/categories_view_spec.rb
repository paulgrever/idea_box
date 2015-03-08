require 'rails_helper'

describe "the category view", type: :feature do
  before(:each) do 
    User.create(username: 'Paul', password: 'test', role: 1)
    visit login_path
    fill_in('session[username]', with: 'Paul')
    fill_in('session[password]', with: 'test')
    click_link_or_button("Login")
  end
  let(:category) do 
    Category.create(theme: "Future Plans")
  end
  let(:category2) do 
    Category.create(theme: "Daily Tasks")
  end

  it "displays all categories on index/home" do
    category
    category2
    visit categories_path
    expect(page).to have_content("Future Plans")
    expect(page).to have_content("Daily Tasks")
    expect(Category.count).to eq(2)
  end


  it "creates a new category" do
    Category.create(theme: "Future Plans")
    visit categories_path
    expect(page).to have_content("Future Plans")
    click_link_or_button("Create A New Category")
    expect(current_path).to eq(new_category_path)
    fill_in('category[theme]', with: "Business Ideas")
    click_link_or_button('Create Category')
    expect(page).to have_content("Business Ideas")
    expect(Category.count).to eq(2) 
  end

  it "deletes a category" do
    category
    category2
    visit categories_path
    expect(Category.count).to eq(2)
    expect(page).to have_content("Future Plans")
    first('.category_item').click_link_or_button("Delete")
    expect(Category.count).to eq(1)
    expect(page).to_not have_content("Future Plans") 
  end
end

