class Admin::ArticlesController < Admin::AdminController

  before_action :authorize_superuser!

  def index
    if params[:articles]
      sort = filters[:sort]
      channel = filters[:channel]
      published = filters[:published]
      featured = filters[:featured]
      user_id = filters[:user_id]
    else
      sort = "Created"
      channel = "Both"
      published = "Both"
      featured = "Both"
      user_id = nil
    end

    @articles =
      Article
        .includes(:user)
        .page(params[:page])
        .per(50)

    case sort
    when "Published"
      @articles = @articles.order(published_at: :desc)
    else
      @articles = @articles.order(created_at: :desc)
    end

    case channel
    when "Advisor"
      @articles = @articles.where(channel: "advisor")
    when "Blog"
      @articles = @articles.where(channel: "blog")
    end

    case published
    when "Published"
      @articles = @articles.where.not(published_at: nil)
    when "Unpublished"
      @articles = @articles.where(published_at: nil)
    end

    case featured
    when "Featured"
      @articles = @articles.where(featured: true)
    when "Not Featured"
      @articles = @articles.where(featured: false)
    end

    if user_id.present?
      @articles = @articles.where(user_id: user_id)
    end
  end

  def new
    @article = Article.new(user: current_user)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to [:admin, @article]
    else
      render action: 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to [:admin, @article]
    else
      render action: 'edit'
    end
  end

  def publish
    @article = Article.find(params[:id])
    @article.publish!
    redirect_to [:admin, @article]
  end

  private

  def article_params
    params
      .require(:article)
      .permit(
        :channel,
        :user_id,
        :title,
        :body,
        :excerpt,
        :featured,
        :ipad_app_featured,
        :ipad_app_position)
  end

  def filters
    params.require(:articles).permit(
      :sort,
      :channel,
      :published,
      :featured,
      :user_id
    )
  end
end
