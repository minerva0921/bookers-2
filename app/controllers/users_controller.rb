class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
    @book = Book.new
  end

  def index
    @book = Book.new
    @user = current_user
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
  	  redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
