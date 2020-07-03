class WareHouse < ApplicationRecord
    belongs_to :supplier
    belongs_to :product
end
class ProductosController < ApplicationController
  before_action :current_producto, only: [:show, :edit, :update, :destroy]

  def index 
    @productos = Producto.all
  end 

  def show 
  end 

  #crear 
  def new 
    @producto = Producto.new 
  end 

  def create 
    @producto = Producto.create(producto_params)
    redirect_to productos_path
  end 

  #editar 
  def edit 
  end 

  def update 
    @producto.update(producto_params)
    redirect_to productos_path
  end 

  #eliminar
  def destroy 
    @producto.destroy
    redirect_to productos_path
  end


  private 
    def producto_params
        params.require(:producto).permit(:nombre, :descripcion, :marca, :modelo, :categoria, :color, :precio)      
    end

    def current_producto
        @producto = Producto.find(params[:id])
    end

end 