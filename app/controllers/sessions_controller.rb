
class SessionsController < ApplicationController
def new

end


  def create
@user=User.find_by(email: params[:sessions][:email].downcase)
    if(@user && @user.authenticate(params[:sessions][:password]))
      flash[:notice]="logged in"
      session[:user_id] = @user.id
      redirect_to articles_path

    else
      flash.now[:danger]="invalid"
      render 'new'
    end


  end

def destroy
session.delete(:user_id)
  flash[:notice]="logged out";
  redirect_to login_path

end


end