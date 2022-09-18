class UsersController < ApplicationController
  before_action :ensure_user, only: [:edit,:update]

  def new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to current_user
    else
       render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_image,:name,:introduction)
  end

   def ensure_user
     unless User.find(params[:id]) == current_user
     redirect_to current_user
     end
   end

end
