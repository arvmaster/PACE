class RecintosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_activated
  before_action :require_PACE
  def index
    @recintos = Recinto.all
  end

  def show
    @recinto = Recinto.find(params[:id])
  end

  def new
    @recinto = Recinto.new
  end

  def create
    @recinto = Recinto.create(recinto_params)
    if @recinto.save
      flash[:success] = "Recinto Creado"
      redirect_to @recinto
    else
      flash[:error] = "No se ha creado el recinto"
      render :new
    end
  end

  def edit
    @recinto = Recinto.find(params[:id])
  end

  def update
    @recinto = Recinto.find(params[:id])
    if @recinto.update(recinto_params)
      flash[:success] = "Se actualizo el recinto"
      redirect_to recintos_url
    else
      flash[:error] = "No se modifico el recinto"
      render :edit
    end
  end

  #def inactivo
  #@recinto.destroy

  #  @recinto.estado = false
  #  @recinto.save
  #      redirect_to recintos_path, success: "Se ha desvinculado el usuario"
  #end

  def destroy
    Recinto.find(params[:id]).destroy
  end

  private

  def recinto_params
    params.require(:recinto).permit(:name)
  end
  def require_activated
    if !current_user.active?
      flash[:error]="Usuario no existe [401]"
      redirect_to root_path

    end
  end
  def require_PACE
    if current_user.role=='Estudiante'
      flash[:error]="No esta autorizado para acceder a esta pagina"
      redirect_to estaticas_path
    end
  end
end
