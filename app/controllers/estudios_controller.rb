class EstudiosController < ApplicationController
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

  #  @estudio.estado = false
  #  @estudio.save
  #     redirect_to estudios_path, success: "Se ha desvinculado el usuario"
  # end


  def destroy
    Estudio.find(params[:id]).destroy
  end

  private

  def estudio_params
    params.require(:estudio).permit(:nombre_estudio, :codigo, :estado)
  end

end
