class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # GET /articles
  # GET /articles.json
  def index
    #@articles = Article.where(is_active: true).order("created_at DESC")
    #@article = Article.new
    @q = Article.ransack(params[:q])
    @articles = @q.result(:distinct => true).page(params[:page])
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    current_user
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def active
    @article = Article.find(params[:id])
    @article.update(is_active: true)
    redirect_to article_path(@article), flash: {notice: "Active Article Now"}
    @articles = Article.where(active: true)
    @article = Article.new
  end

  def inactive
    @article = Article.find(params[:id])
    @article.update(is_active: false)
    redirect_to article_path(@article), flash: {notice: "Inctive Article Now"}
    @articles = Article.where(active: false)
    @article = Article.new
  end

  def article_by_status
    if params[:status] == "active"
      @articles = Article.active_articles
    elsif params[:status] == "inactive"
      @articles = Article.inactive_articles
    else
      @articles = Article.all
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
      end


    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, pictures_attributes:[:name, :imageable_id, :imageable_type, :_destroy])
    end
end
