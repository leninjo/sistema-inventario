class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index 
    @categorias = Category.paginate(page: params[:page], per_page: 5)
  end 

  #crear 
  def new 
    @categoria = Category.new 
  end 

  def create 
    @categoria = Category.create(category_params)
    redirect_to categories_path
  end 

  #editar 
  def edit 
  end 

  def update 
    @categoria.update(category_params)
    redirect_to categories_path
  end 

  #eliminar
  def destroy 
    @categoria.destroy
    redirect_to categories_path
  end


  private 
    def category_params
        params.require(:category).permit(:nombre, :descripcion)      
    end

    def set_category
        @categoria = Category.find(params[:id])
    end
end
