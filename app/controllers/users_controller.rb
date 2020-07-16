class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find_by(id: params[:id])
    # add logic for authorization

    #debugger
  end
end
