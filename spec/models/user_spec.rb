require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do 
    User.new(username: 'test_user', password: 'test')
  end
  let(:user_admin) do 
    User.new(username: 'admin', password: 'test', role: 1)
  end

  it "is a valid user when created" do
    expect(user).to be_valid
  end

  it "is automatically a default user when entered" do
    expect(user.role).to eq('default')
    expect(user.default?).to eq(true)
  end

  it "is an admin when role is assigned" do
    expect(user_admin.admin?).to eq(true)
    expect(user_admin.role).to eq('admin')
  end

  it "is invalid without a username" do
    user.username = nil
    expect(user).to_not be_valid
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).to_not be_valid
  end
end
