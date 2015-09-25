class ProductCategoriesController < ApplicationController
  before_action :getProductCategory,only: [:show,:edit,:update,:destroy]


  def index
    @product_category = ProductCategory.all
  end

  def new
    @product_category = ProductCategory.new

    render :new
  end

  def create
    @product_category = ProductCategory.create(getParams)
    redirect_to product_categories_path
  end

  def  edit
    render :edit
  end

  def update
    @product_category.update(getParams)

    redirect_to product_categories_path
  end

  def destroy
    @product_category.destroy;
    redirect_to product_categories_path
  end

  def show

  end

  private

  def getProductCategory
    @product_category = ProductCategory.find(params[:id])
  end

  def getParams
    params.require(:product_category).permit(:name,:description,:content,:display)

  end

end
