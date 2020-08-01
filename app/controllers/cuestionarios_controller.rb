class CuestionariosController < ApplicationController
  #before_action :authenticate_user!
  def index
    @cuestionarios = Cuestionario.all
  end

  def show
    @cuestionario = Cuestionario.find(params[:id])
    @preguntas = PreguntaCuestionario.where(cuestionario_id: @cuestionario.id)
  end

  def new
    @cuestionario = Cuestionario.new
  end

  def create
    @cuestionario = Cuestionario.create(cuestionario_params)
    @cuestionario.user_id = current_user.id
    if @cuestionario.save
      preguntas = [{pregunta_cues: 'Muchas veces actúo sin mirar las consecuencias.',casilla: false ,respuesta: 'a' ,cuestionario_id: @cuestionario.id },
                   {pregunta_cues: 'Disfruto cuando tengo tiempo para preparar mi trabajo y realizarlo a conciencia.',casilla: false ,respuesta: 'r' ,cuestionario_id: @cuestionario.id },
                   {pregunta_cues: 'Estoy seguro/a de lo que es bueno y lo que es malo, lo que está bien y lo que está mal',casilla: false ,respuesta: 't' ,cuestionario_id: @cuestionario.id },
                   {pregunta_cues: 'Tengo fama de decir lo que pienso claramente y sin rodeos.',casilla: false ,respuesta: 'p' ,cuestionario_id: @cuestionario.id },]
      @cpreguntas = PreguntaCuestionario.create(preguntas)
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
    params.require(:cuestionario).permit(:nombre_cues, :casilla, :respuesta, :user_id)
  end

end
