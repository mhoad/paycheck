class ProductsController < ApplicationController

def index
  @products = Product.paginate(:page => params[:page]).per_page(2)
end

def new
  @product = Product.new
end

def create
  @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "Product sucessfully added"
      redirect_to @product
    else
      render 'new'
    end
end

def show
  @product = Product.find(params[:id])
end

def edit
  @product = Product.find(params[:id])
end

def update
  @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:success] = "Product successfully updated"
      redirect_to @product
    else
      render 'edit'
    end
end

def destroy
  Product.find(params[:id]).destroy
    flash[:success] = "Product successfully deleted"
    redirect_to products_path
end

end
