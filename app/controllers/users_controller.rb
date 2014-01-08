class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
      respond_to do |format|
        if @user.save
          UserMailer.welcome_email(@user).deliver
          format.html { redirect_to(@user, notice: 'User was successfully created.') }
        else
          format.html { render action: 'new' }
        end
      end
    end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
