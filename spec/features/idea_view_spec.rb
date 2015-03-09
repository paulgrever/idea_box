require 'rails_helper'

describe "the idea view", type: :feature do
  let(:idea) { Idea.create(title: 'Thought', body: 'filler', category_id: category.id) }
  let(:category) {Category.create(theme: "Dreams")}
  before(:each) do 
    User.create(username: 'Paul', password: 'test', role: 1)
    visit login_path
    fill_in('session[username]', with: 'Paul')
    fill_in('session[password]', with: 'test')
    click_link_or_button("Login")
  end

  it "can view the index as an admin" do
    category
    idea
    visit ideas_path
    expect(page).to have_content("Thought")
  end

  it "can view ideas that user has created" do
    category
    idea
    visit ideas_path
    click_link_or_button("Thought")
    expect(current_path).to eq(idea_path(2))
  end

  it "creates a new idea" do
    category
    visit ideas_path
    expect(page).to have_content("Idea Page")
    click_link_or_button("New Idea")
    expect(current_path).to eq(new_idea_path)
    fill_in('idea[title]', with: "Idea3")
    fill_in('idea[body]', with: "Boring Details")
    select('Dreams', :from => "idea[category_id]")
    click_link_or_button('Create Idea')
    expect(Idea.count).to eq(1)
    expect(page).to have_content("Idea3")
  end

  it "edits an exisiting idea" do
    idea 
    visit idea_path(idea)
    click_link_or_button("Edit Idea")
    expect(current_path).to eq(edit_idea_path(idea)) 
    fill_in('idea[title]', with: "Idea3")
    fill_in('idea[body]', with: "Boring Details")
    
    within(".actions") do 
      click_link_or_button("Update Idea")
    end
    expect(page).to have_content("Idea3")
  end

  it "deletes an idea" do
    expect(Idea.count).to eq(0)
    idea
    expect(Idea.count).to eq(1)
    visit idea_path(idea)
    click_link_or_button("Bad Idea Remover")
    expect(Idea.count).to eq(0)

  end

end