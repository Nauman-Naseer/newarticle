class CatagoriesController < ApplicationController
  before_action :'check_user' ,only: [:new,:create]
  def new
@cat=Catagory.new
  end
  def show
    @cat=Catagory.find(params[:id])

    @articles=@cat.articles.paginate(:page => params[:page], :per_page => 2)

  end
  def create
@cat=Catagory.new(get_params)
if @cat.save
  redirect_to catagory_path(@cat)
else
  render "new_catagory"
end

  end
  def index
    @cat=Catagory.all
  end
  def get_params
    params.require(:catagory).permit(:name)
  end
  def check_user
    if logged_in? ==false ||  current_user.admin !=true
      flash[:notice]="please login as admin"
      redirect_to root_path
    end
  end
end