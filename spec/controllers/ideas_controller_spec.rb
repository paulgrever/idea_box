require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  before(:each) do 
    User.create(username: 'Paul', password: 'test', role: 1)
    visit login_path
    fill_in('session[username]', with: 'Paul')
    fill_in('session[password]', with: 'test')
    click_link_or_button("Login")
  end
let(:valid_attributes) {
    { title: "Title", body: 'Text' }
  }

  let(:invalid_attributes) {
    { title: nil, body: nil}
  }

  let(:valid_session) { {} }
  

  
end
