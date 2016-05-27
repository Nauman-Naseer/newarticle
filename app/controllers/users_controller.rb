class UsersController < ApplicationController
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
    @user=User.find(params[:id]);

  end
  def show
    @user=User.find(params[:id]);
    
  end
  def destroy
    @user=User.find(params[:id])
    if( @user.destroy)

      flash[:notice]="User Deleted adn All Article ";
      redirect_to users_path;
    end
  end
  def get_params

  params.require(:user).permit(:name,:email,:password);

  end
end