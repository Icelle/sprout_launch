# class UsersController < ApplicationController
#   before_filter :user_is_current_user
#   def new
#     @user = User.new
#   end

#   def create
#     @user = User.new(params[:user])
#       respond_to do |format|
#         if @user.save
#           UserMailer.welcome_email(@user).deliver
#           format.html { redirect_to(@user, notice: 'User was successfully created.') }
#         else
#           format.html { render action: 'new' }
#         end
#       end
#     end
#   end

#   def index
#     @user_is_current_user
#   end

#   def failed
#     redirect_to root_path error: 'Failed to authenticate'
#   end

#   def destroy
#     session[:user_id] = nil
#     redirect_to root_path, notice: 'Signed Out!'
#   end


# private
#   def user_params
#     params.require(:user).permit(:first_name, :last_name, :email)
#   end

#   def user_is_current_user
#     unless current_user.id == params[:user_id]
#       flash[:notice] = "Please sign in."
#       redirect_to root_path
#     end
#   end
# end
