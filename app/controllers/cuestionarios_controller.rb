class CuestionariosController < ApplicationController
  before_action :authenticate_user!

  def index
    @cuestionarios = Cuestionario.all
  end

  def show
    @cuestionario = Cuestionario.find(params[:id])
    @preguntas = PreguntaCuestionario.where(cuestionario_id: @cuestionario.id)
  end

  def new
    if current_user.rol == "Admin"
      @cuestionario = Cuestionario.new
      6.times {@cuestionario.pregunta_cuestionarios.build}
    else
      @cuestionario = Cuestionario.new
    end
  end

  def create
    if current_user.rol == "Admin"
        @cuestionario = Cuestionario.create(cuestionario_params)
        @cuestionario.user_id = current_user.id
        if @cuestionario.save
           @cuestionario.eda_a = 0
           @cuestionario.eda_t = 0
           @cuestionario.eda_r = 0
           @cuestionario.eda_p = 0
           @cuestionario.save
           flash[:success] = "Cuestionario Creado"
          redirect_to @cuestionario
        else
          flash[:error] = "No se ha creado el cuestionario"
          render :new
        end
    else
      @user = User.find_by(rol: "Admin")
      @cuestionario = Cuestionario.create(cuestionario_params)
      @cuestionario.user_id = current_user.id
      if @cuestionario.save
         @cuestionario = Cuestionario.find_by(nombre_cues: @cuestionario.nombre_cues, user_id: @user.id )
         @cuestionario.eda_a = 0
         @cuestionario.eda_t = 0
         @cuestionario.eda_r = 0
         @cuestionario.eda_p = 0
         @cuestionario.save
         flash[:success] = "Cuestionario Creado"
         redirect_to edit_cuestionario_path(@cuestionario.id)
      else
         flash[:error] = "No se ha creado el cuestionario"
         render :new
      end
    end
  end

  def edit
    @cuestionario = Cuestionario.find(params[:id])
  end

  def update
    @cuestionario = Cuestionario.find(params[:id])
    #if current_user.rol == "Admin" or ""
    if @cuestionario.update(cuestionario_params)
       @cuestionario.eda_a = PreguntaCuestionario.where(cuestionario_id: @cuestionario.id , casilla: true ,respuesta: 'a').count
       @cuestionario.eda_t = PreguntaCuestionario.where(cuestionario_id: @cuestionario.id , casilla: true ,respuesta: 't').count
       @cuestionario.eda_r = PreguntaCuestionario.where(cuestionario_id: @cuestionario.id , casilla: true ,respuesta: 'r').count
       @cuestionario.eda_p = PreguntaCuestionario.where(cuestionario_id: @cuestionario.id , casilla: true ,respuesta: 'p').count
       @cuestionario.save
      flash[:success] = "Se actualizo el cuestionario"
      redirect_to @cuestionario
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

  #def cuestionario_eda
  #  @user = User.where(rol: "Admin")
  #  @gotcues = Cuestionario.where("nombre_cues LIKE ?",@cuestionario.nombre_cues + "%").limit(1)
    #if @gotcues.user_id == @user.id
         #redirect_to edit_cuestionario_path(@gotcues.id)
     #else
  # find_by me permite duplicar, debido a que devuelve solo un elemento,where devuelve dentro un array
      #@cuestionario = Cuestionario.find(params[:id]).amoeba_dup
      # end

  def cuestionario_params
    params.require(:cuestionario).permit( :nombre_cues, :eda_a, :eda_t, :eda_r, :eda_p, :user_id, pregunta_cuestionarios_attributes: [:id, :casilla, :pregunta_cues, :respuesta])
  end

end
