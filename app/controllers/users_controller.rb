class UsersController < ApplicationController
  before_filter :redirect_unless_current_user_exists
  before_filter :authorize

  def index
  end
  def show
    @user = User.find(params[:id])  
    authorize! :read, @user 
    @ideas = @user.ideas
  end

    private
  def authorize
    if current_user.nil?
      redirect_to login_path, alert: "Not authorized"
    end
  end
end
