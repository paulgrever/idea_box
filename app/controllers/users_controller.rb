class UsersController < ApplicationController
  before_filter :authorize

  def show

    @user = User.find(params[:id])  
    authorize! :read, @user 
    @ideas = @user
  end

    private
  def authorize
    if current_user.nil?
      redirect_to login_path, alert: "Not authorized"
    end
  end
end
