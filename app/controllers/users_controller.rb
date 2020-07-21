class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :show, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome, You have successfully created your account."
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to users_path unless @user
    @discussion = Discussion.new(book_id: params[:book_id])
    @discussions = @user.discussions.paginate(page: params[:page], per_page: 5)
    #debugger
  end

  def edit
    
  end

  def update
    
    if @user.update(user_params)
      #handle successful update
      flash[:success] = 'Your profile has been successfully updated'
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    user = User.find_by(params[:id])
    if user
      user.destroy
      flash[:success] = 'Account successfully deleted'
      
    else
      flash[:danger] = 'Unable to delete the selected user'
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  

end
