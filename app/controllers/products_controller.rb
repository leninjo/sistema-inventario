class ProductsController < ApplicationController
  before_action :set_producto, only: [:edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]
  before_action :set_suppliers, only: [:new, :edit]

  def index 
    @productos = Product.paginate(page: params[:page], per_page: 5)
  end 

  #crear 
  def new 
    @producto = Product.new 
  end 

  def create 
    @producto = Product.create(producto_params)
    redirect_to products_path
  end 

  #editar 
  def edit 
  end 

  def update 
    @producto.update(producto_params)
    redirect_to products_path
  end 

  #eliminar
  def destroy 
    @producto.destroy
    redirect_to products_path
  end


  private 
    def producto_params
        params.require(:product).permit(:nombre, :descripcion, :marca, :modelo, :existencia, :precio, :category_id, :supplier_id)      
    end

    def set_producto
        @producto = Product.find(params[:id])
    end

    def set_categories
        @categorias = Category.all 
    end 

    def set_suppliers 
        @proveedores = Supplier.all 
    end 

end 