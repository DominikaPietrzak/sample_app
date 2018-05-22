class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save

      log_in @user
      redirect_to @user
      flash[:success] = "Welcome to the Sample page"
    else
      render 'new'
      flash[:danger] = "Failure"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)

    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

end
