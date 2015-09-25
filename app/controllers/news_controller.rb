class NewsController < ApplicationController
  before_action :getInfo,only: []


  def index
    @news = News.all
  end

  def new
    @news = News.new
  end

  def create
    @params = getParams

    render text: @params[:name].parameterize

  end

  private
  def getInfo
    @new = News.find params[:id]
  end

  def getParams
    params.require(:news).permit(:name,:description,:content,:display,:image)
  end

end
