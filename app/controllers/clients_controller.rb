class ClientsController < ApplicationController 
  before_action :set_client, only: [:edit, :update, :destroy]

  def index 
    @clientes = Client.all
  end 

  #crear 
  def new 
    @cliente = Client.new 
  end 

  def create 
    @cliente = Client.create(client_params)
    redirect_to clients_path
  end 

  #editar 
  def edit 
  end 

  def update 
    @cliente.update(client_params)
    redirect_to clients_path
  end 

  #eliminar
  def destroy 
    @cliente.destroy
    redirect_to clients_path
  end


  private 
    def client_params
        params.require(:client).permit(:nombre, :direccion, :telefono)      
    end

    def set_client
        @cliente = Client.find(params[:id])
    end

end 