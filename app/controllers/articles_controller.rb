class ArticlesController <ApplicationController
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
@article=articles.new(article_params);
@article.user_id=User.last.id
if @article.save
flash[:notice]="Successfuly created"
redirect_to article_path(@article);
else
  render new_article_path
end

  end
  def edit

    @article=Article.find(params[:id]);


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
end