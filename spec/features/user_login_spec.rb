require 'rails_helper'

RSpec.describe "Registered User" do 
  include Capybara::DSL

  it "cannot login without username and password" do
    User.create(username: 'Paul', password: 'test')
    visit login_path
    fill_in('session[username]', with: 'Paul')
    fill_in('session[password]', with: 'test')
    click_link_or_button("Login")
    expect(page).to  have_content("Welcome Paul")
  end

  it "cannot login with invalid credentials" do
    User.create(username: 'Paul', password: 'test')
    visit login_path
    fill_in('session[username]', with: 'Paul')
    fill_in('session[password]', with: 'fake')
    click_link_or_button("Login")
    expect(page).to  have_content("Invalid Login")
  end

  it 'can logout' do
    User.create(username: 'Paul', password: 'test')
      visit login_path
      fill_in('session[username]', with: 'Paul')
      fill_in('session[password]', with: 'test')
      click_link_or_button("Login")
      expect(page).to have_content("Welcome Paul")
      click_link_or_button("log out")
  
      expect(page).to have_content('Goodbye')
    end

    it "cannot view other users profiles as a default user" do
      user1 = User.create(username: 'Paul', password: 'test')
      user2 = User.create(username: 'default', password: 'test')
      visit login_path
      fill_in('session[username]', with: 'Paul')
      fill_in('session[password]', with: 'test')
      click_link_or_button("Login")
      expect(page).to have_content("Welcome Paul")
      visit user_path(user2)
      expect(page).to have_content("You are not authorized to access this page.")

    end


end