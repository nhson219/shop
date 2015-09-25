class ProductsController < ApplicationController
  before_action :get_product,only: [:show,:edit,:update,:destroy]

  def index

    @product = Product.all()

    render :index
  end

  def new

    @product = Product.new;
    # @product_category = ProductCategory.pluck(:name,:id);
    @product_category = ProductCategory.all.collect {|p| [ p.name, p.id ] }

    render :new
  end

  def create

    @product = Product.new(product_params)

    if @product.save()
      # redirect_to @product
      redirect_to action: "index"
    else
      render :new
    end

  end

  def show

    @comment = Comment.new
    #@product = Product.new
    @comments = @product.comments


  end

  def edit
    @product_category = ProductCategory.all.collect {|p| [ p.name, p.id ] }
  end

  def update

    if @product.update(product_params)
       redirect_to product_path(params[:id])
    else

    end

  end

  def destroy
    if @product.destroy()
      redirect_to products_path
    else

    end
  end

  private

    def get_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name,:description,:content,:display,:product_category_id,:avatar)
    end

end
