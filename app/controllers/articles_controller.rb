class ArticlesController <ApplicationController
  before_action 'set_article',only: [:edit,:destroy]
  before_action 'check_user',only: [:edit,:new,:destroy]
  before_action 'require_same_user',only: [:edit,:destroy]
  def new
    @article=Article.new

  end
  def show
    @article=Article.find(params[:id]);

  end
  def  index
    @article=Article.paginate(:page => params[:page], :per_page => 3)
  end


  def create




#render plain: params[:article].inspect
@article=Article.new(article_params);
@article.user_id=session[:user_id];
if @article.save
flash[:notice]="Successfuly created"
redirect_to article_path(@article);
else
  render new_article_path
end

  end
  def edit



  end
  def update
    @art=Article.find(params[:id]);

    if(@art.update(article_params))
      flash[:notice]="Successfully Updated";
      redirect_to article_path(@art);


    else
      flash[:notice]="Error in Update";
      redirect_to articles_path

    end

  end
  def destroy
    @art=Article.find(params[:id])
  if(@art.destroy)
  flash[:notice]="Article Deleted"
  redirect_to articles_path


  end

  end
  def article_params
    params.require(:article).permit(:name,:des);
  end
  def set_article
    @article=Article.find(params[:id]);

  end
  def check_user
if (logged_in? !=true)
    flash[:notice]="Pleas Log in "
    redirect_to root_path


end
def require_same_user
 if(current_user!=@article.user)
flash[:notice]="not same User";
   redirect_to root_path
 end

  end



  end
end