class UsersController < ApplicationController
  before_action 'set_user',only: [:edit,:show,:destroy]
  before_action 'check_user',only: [:edit,:destroy,:update]
  before_action 'same_user',only: [:edit,:destroy,:update]
  def new
@user=User.new

  end
def create
@user=User.new(get_params)
 if(@user.save)
   flash[:notice]="Successfully sign up";
   redirect_to user_path(@user);
 else
   render 'new';

 end


end

  def index
    @user =User.paginate(:page => params[:page], :per_page => 3)
  end
  def edit

  end
  def show

  end
  def destroy
    if( @user.destroy)

      flash[:notice]="User Deleted adn All Article ";
      redirect_to users_path;
    end
  end
  def get_params

  params.require(:user).permit(:name,:email,:password);

  end
  def set_user
    @user=User.find(params[:id]);

  end
  def check_user
if (logged_in? ==false)
  flash[:notice]="Please Log In"
  redirect_to root_path

end
  end
  def same_user
    if current_user!=@user && !current_user.admin?
      redirect_to root_path
    end
  end
end