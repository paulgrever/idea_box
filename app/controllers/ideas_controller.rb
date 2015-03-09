class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :destroy, :update]
  before_filter :redirect_unless_current_user_exists
  before_filter :redirect_unless_current_user_admin, only: [:index]
  def index
    @ideas = Idea.all
  end

  def show
    # @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new(title: params[:title], body: params[:body], category_id: params[:category_id], user_id: current_user.id)
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to user_path(current_user)
  end

 private
  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :body, :category_id, :user_id)
  end
end
