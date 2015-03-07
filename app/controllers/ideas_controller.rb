class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :destroy, :update]
  def index
    @ideas = Idea.all
  end

  def show
    # @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new(title: params[:title], body: params[:body], category_id: params[:category_id])
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to ideas_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      redirect_to ideas_path
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

 private
  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :body, :category_id)
  end
end
