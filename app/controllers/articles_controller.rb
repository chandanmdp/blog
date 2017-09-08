class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end


def index
  @candidates = Candidate.sorted
end

def show
  @candidate = Candidate.find(params[:id])
end

def new
  @candidate = Candidate.new
end

def create
  @candidate = Candidate.new(candidate_params)
  if @candidate.save
    redirect_to(candidates_path)
  else
    render ('new')
  end
end

def edit
  @candidate = Candidate.find(params[:id])
end

def update
  @candidate = Candidate.find(params[:id])
  if @candidate.update_attributes(candidate_params)
    redirect_to(candidate_path(@candidate))
  else
    render ('edit')
  end
end
