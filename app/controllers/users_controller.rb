class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, You have successfully created your account."
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    # add logic for authorization

    #debugger
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
