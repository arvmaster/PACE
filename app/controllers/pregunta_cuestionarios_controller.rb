class PreguntaCuestionariosController < ApplicationController
  def index
    @pregunta_cuestionarios = PreguntaCuestionario.all
  end

  def show
    @pregunta_cuestionario = PreguntaCuestionario.find(params[:id])
  end

  def new
    @pregunta_cuestionario = PreguntaCuestionario.new
  end

  def create
    @pregunta_cuestionario = PreguntaCuestionario.create(pregunta_cuestionario_params)
    if @pregunta_cuestionario.save
      flash[:success] = "PreguntaCuestionario Creado"
      redirect_to @pregunta_cuestionario
    else
      flash[:error] = "No se ha creado el pregunta_cuestionario"
      render :new
    end
  end

  def edit
    @pregunta_cuestionario = PreguntaCuestionario.find(params[:id])
  end

  def update
    @pregunta_cuestionario = PreguntaCuestionario.find(params[:id])
    if @pregunta_cuestionario.update(pregunta_cuestionario_params)
      flash[:success] = "Se actualizo el pregunta_cuestionario"
      redirect_to pregunta_cuestionarios_url
    else
      flash[:error] = "No se modifico el pregunta_cuestionario"
      render :edit
    end
  end


  #def inactivo
  # @pregunta_cuestionario.destroy

  # @pregunta_cuestionario.estado = false
  # @pregunta_cuestionario.save
  #      redirect_to pregunta_cuestionarios_path, success: "Se ha desvinculado el usuario"
  #end


  def destroy
    PreguntaCuestionario.find(params[:id]).destroy
  end

  private

  def pregunta_cuestionario_params
    params.require(:pregunta_cuestionario).permit(:pregunta_cues,:respuesta)
  end

end
