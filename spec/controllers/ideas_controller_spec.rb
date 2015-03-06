require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
let(:valid_attributes) {
    { title: "Title", body: 'Text' }
  }

  let(:invalid_attributes) {
    { title: nil, body: nil}
  }

  let(:valid_session) { {} }
  describe "GET #index" do
    it "assigns all Ideas as @ideas" do
      idea = Idea.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:ideas)).to eq([idea])
    end
  end

  describe "GET #show" do
    it "assigns the requested idea as @idea" do
      idea = Idea.create! valid_attributes
      get :show, {:id => idea.to_param}, valid_session
      expect(assigns(:idea)).to eq(idea)
      expect(response.status).to eq(200)
    end
  end

   describe "GET #new" do
    it "assigns a new idea as @idea" do
      get :new, {}, valid_session
      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  
end
