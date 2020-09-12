class NewsController < ApplicationController

  def new
    @news = News.new
    date = params[:date]

  end

  def create
    @news = News.new(news_params)
    @news.save
    redirect_to root_path
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      flash[:notice] = "NEWSが更新されました！"
      redirect_to kanri_path
    else
      render 'edit'
    end
  end

  def destroy
    news = News.find(params[:id])
    news.destroy
    flash[:notice] = "NEWSが削除されました！"
    redirect_to kanri_path
  end

  private

  def news_params
    params.require(:news).permit(:year, :month, :date, :title, :published)
  end

end