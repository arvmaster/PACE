class InformesController < ApplicationController
  before_action :authenticate_user!

  def index
    @informes = Informe.all
  end

  def show
    @informe = Informe.find(params[:id])
    @preguntas = PreguntaInforme.where(informe_id: @informe.id)
  end

  def new
    @informe = Informe.new
    @cpreguntas = PreguntaInforme.new
  end

  def create
    @informe = Informe.create(informe_params)
    @informe.user_id = current_user.id
    if @informe.save
      preguntas = [{pregunta_inf: '¿quien soy?',respuesta: '' ,informe_id: @informe.id }, {pregunta_inf: '¿Donde estoy?',respuesta: '' ,informe_id: @informe.id }]
      @ipreguntas = PreguntaInforme.create(preguntas)
      flash[:success] = "Informe Creado"
      redirect_to @informe
    else
      flash[:error] = "No se ha creado el informe"
      render :new
    end
  end

  def edit
    @informe = Informe.find(params[:id])
  end

  def update
    @informe = Informe.find(params[:id])
    if @informe.update(informe_params)
      flash[:success] = "Se actualizo el informe"
      redirect_to informes_url
    else
      flash[:error] = "No se modifico el informe"
      render :edit
    end
  end
  #def inactivo
  #informe.destroy

  #  @informe.estado = false
  #  @informe.save
  #     redirect_to informes_path, success: "Se ha desvinculado el usuario"
  #end
  def destroy
    Informe.find(params[:id]).destroy
  end
  private

  def informe_params
    params.require(:informe).permit(:nombre_inf, :user_id)
  end
end


