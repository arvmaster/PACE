class EstudiosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_activated
  before_action :require_PACE

  def index
    @estudios = Estudio.all
  end

  def show
    @estudio = Estudio.find(params[:id])
  end

  def new
    @estudio = Estudio.new
  end

  def create
    @estudio = Estudio.create(estudio_params)
    if @estudio.save
      flash[:success] = "Estudio Creado"
      redirect_to @estudio
    else
      flash[:error] = "No se ha creado el estudio"
      render :new
    end
  end

  def edit
    @estudio = Estudio.find(params[:id])
  end

  def update
    @estudio = Estudio.find(params[:id])
    if @estudio.update(estudio_params)
      flash[:success] = "Se actualizo el estudio"
      redirect_to estudios_url
    else
      flash[:error] = "No se modifico el estudio"
      render :edit
    end
  end

  #
  #def inactivo
  #estudio.destroy

  #  @estudio.active = false
  #  @estudio.save
  #     redirect_to estudios_path, success: "Se ha desvinculado el usuario"
  # end


  def destroy
    Estudio.find(params[:id]).destroy
  end

  def import
    Estudio.import(params[:file])
    redirect_to estudios_path, notice: "Datos importados."
  end

  private

  def estudio_params
    params.require(:estudio).permit(:name, :code, :active, :recinto_id)
  end
  def require_activated
    unless current_user.active?
      flash[:error] = "Usuario no existe [401]"
      redirect_to root_path
    end
  end
  def require_PACE
    if current_user.role == 'Estudiante'
      flash[:error]="No esta autorizado para acceder a esta pagina"
      redirect_to estaticas_path
    end
  end

end
