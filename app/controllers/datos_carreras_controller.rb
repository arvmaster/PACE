class DatosCarrerasController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  def index
    @datos_carreras = DatosCarrera.all
  end

  def show
    @datos_carrera = DatosCarrera.find(params[:id])
  end

  def new
    @datos_carrera = DatosCarrera.new
  end

  def create
    @datos_carrera = DatosCarrera.create(datos_carrera_params)
    @datos_carrera.user_id = current_user.id
    if @datos_carrera.save
      flash[:success] = "DatosCarrera Creada"
      redirect_to @datos_carrera
    else
      flash[:error] = "No se ha creado el datos_carrera"
      render :new
    end
  end

  def edit
    @datos_carrera = DatosCarrera.find(params[:id])
  end

  def update
    @datos_carrera = DatosCarrera.find(params[:id])
    if @datos_carrera.update(datos_carrera_params)
      flash[:success] = "Se actualizo el datos_carrera"
      redirect_to datos_carreras_url
    else
      flash[:error] = "No se modifico el datos_carrera"
      render :edit
    end
  end

  #def inactivo
  #@datos_carrera.destroy

  #  @datos_carrera.estado = false
  #  @datos_carrera.save
  #      redirect_to datos_carreras_path, success: "Se ha desvinculado el usuario"
  #end

  def destroy
    DatosCarrera.find(params[:id]).destroy
  end

  private

  def datos_carrera_params
    params.require(:datos_carrera).permit( :nombre_carrera, :matricula_hombre, :matricula_mujer, :user_id)
  end

end
