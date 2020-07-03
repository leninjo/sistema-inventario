class SuppliersController < ApplicationController 
  before_action :set_supplier, only: [:edit, :update, :destroy]

  def index 
    @proveedores = Supplier.paginate(page: params[:page], per_page: 5)
  end 

  #crear 
  def new 
    @proveedor = Supplier.new 
  end 

  def create 
    @proveedor = Supplier.create(supplier_params)
    redirect_to suppliers_path
  end 

  #editar 
  def edit 
  end 

  def update 
    @proveedor.update(supplier_params)
    redirect_to suppliers_path
  end 

  #eliminar
  def destroy 
    @proveedor.destroy
    redirect_to suppliers_path
  end


  private 
    def supplier_params
        params.require(:supplier).permit(:nombre, :direccion, :telefono)      
    end

    def set_supplier
        @proveedor = Supplier.find(params[:id])
    end

end 