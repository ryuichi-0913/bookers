class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  @book = Book.new
   @user = User.find(params[:id]) # ここを記述
   @books = @user.books
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
    @use = User.find(params[:id])
  end

  def destroy
   @user = User.find(params[:id])
   @user.destroy
   redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
