class UsersController < ApplicationController
    before_action :set_user, only: [:show, :destroy]
    before_action :require_admin, only: [:destroy]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to projects_path, notice: 'Successfully signed up!'
      else
        render :new
      end
    end
  
    def show
    end
  
    def destroy
      @user.destroy
      redirect_to root_path, notice: 'User was successfully deleted.'
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
    def require_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'You are not authorized to perform this action.'
      end
    end
end