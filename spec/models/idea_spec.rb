require 'rails_helper'

RSpec.describe Idea, type: :model do
  let(:idea) do 
    Idea.new(title: "Dream", body: "TEXT")
  end

  it "exits" do
    expect(idea).to be_valid
  end

  it "it has valid attributes" do
    expect(idea.title).to eq("Dream")
    expect(idea.body).to eq("TEXT")
  end

  it "is invalid without a title" do
    idea.title = nil
    expect(idea).to_not be_valid
  end

  it "is invalid without a body" do
    idea.body = nil
    expect(idea).to_not be_valid
  end

  it "has an id when valid and saved" do
    idea1 =Idea.create(title: "Dream", body: "TEXT")
    expect(idea1.id).to eq(1)
  end
end
