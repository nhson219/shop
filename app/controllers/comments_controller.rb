class CommentsController < ApplicationController
  before_action :getInfo,only: [:destroy]

  def create
    # render :text => params[:comment][:content]
    @product = Product.find(params[:product_id])
    @comment = Comment.new

    @comment.content = getParams[:content]
    @comment.commentable = @product

    @comment.save!
    #render :text => params
    redirect_to product_path params[:product_id]
  end


  def index
    @comments = Comment.all
  end

  def destroy

    if @comment.destroy()
      redirect_to comments_path
    else
      render :text => "destroy fails"
    end
  end

  def getInfo
    @comment = Comment.find(params[:id])
  end

  def getParams
    params.require(:comments).permit(:content)
  end

end
