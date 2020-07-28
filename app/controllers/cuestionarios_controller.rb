class CuestionariosController < ApplicationController
  before_action :authenticate_user!
  def index
    @cuestionarios = Cuestionario.all
  end

  def show
    @cuestionario = Cuestionario.find(params[:id])
  end

  def new
    @cuestionario = Cuestionario.new
  end

  def create
    @cuestionario = Cuestionario.create(cuestionario_params)
    @cuestionario.user_id = current_user.id
    if @cuestionario.save
      flash[:success] = "Cuestionario Creado"
      redirect_to @cuestionario
    else
      flash[:error] = "No se ha creado el cuestionario"
      render :new
    end
  end

  def edit
    @cuestionario = Cuestionario.find(params[:id])
  end

  def update
    @cuestionario = Cuestionario.find(params[:id])
    if @cuestionario.update(cuestionario_params)
      flash[:success] = "Se actualizo el cuestionario"
      redirect_to cuestionarios_url
    else
      flash[:error] = "No se modifico el cuestionario"
      render :edit
    end
  end


  #def inactivo
  #cuestionario.destroy

  #  @cuestionario.estado = false
  #  @cuestionario.save
  #     redirect_to cuestionarios_path, success: "Se ha desvinculado el usuario"
  #end

  def destroy
    Cuestionario.find(params[:id]).destroy
  end

  private

  def cuestionario_params
    params.require(:cuestionario).permit(:nombre_cues)
  end

end
