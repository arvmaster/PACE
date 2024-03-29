class DatosCarrerasController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  helper_method :sort_column,:sort_direction
  def index
    @datos_carreras = DatosCarrera.order(sort_column + " " + sort_direction)
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
  #      redirect_to datos_carreras_path,success: "Se ha desvinculado el usuario"
  #end

  def destroy
    DatosCarrera.find(params[:id]).destroy
  end

  def import
    DatosCarrera.import(params[:file])
    redirect_to datos_carreras_path, notice: "Datos importados."
  end

  private

  def sort_column
    DatosCarrera.column_names.include?(params[:sort]) ? params[:sort] : "nombre_carrera"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def datos_carrera_params
    params.require(:datos_carrera).permit(:nombre_carrera, :area, :institucion, :ret_1a, :pun_last_ma, :duracion_for, :duracion_real, :emp_1a, :emp_2a, :mat_h, :mat_m, :tit_h, :tit_m, :ing_1a, :ing_5a, :ing_10a, :user_id)
  end

end
