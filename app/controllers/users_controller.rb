class UsersController < ApplicationController
  #before_action :is_matching_login_user, only: [:edit, :update]


  def index
    @users = User.all
    @user = current_user
    @book = Book.new

  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    else
      render :edit
    end


  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
end


private
def user_params
 params.require(:user).permit(:name, :introduction, :profile_image)
end

def is_matching_login_user
  user_id = params[:id].to_i
  unless user_id == current_user.id
    redirect_to book_path(current_user)
  end
end