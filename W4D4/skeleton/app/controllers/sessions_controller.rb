class SessionsController < ApplicationController

  before_action :ensure_logged_in, only: [:destroy]
  before_action :ensure_logged_out, except: [:destroy]

  def new

    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:user_name],user_params[:password])
    if @user
      login(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["Incorrect credentials!"]
      render :new
    end
  end

  def destroy
    logout
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
