class InformesController < ApplicationController
  before_action :authenticate_user!

  def index
    @informes = Informe.all
  end

  def show
    @informe = Informe.find(params[:id])
  end

  def new
    if current_user.rol == "Admin"
      @informe = Informe.new
      4.times { @informe.pregunta_informes.build }
    else
      @informe = Informe.new
    end
    #@informe.pregunta_informes.build(pregunta_inf: '¿Que acontecio en el evento/reunion?',respuesta: '' )
    #@informe.pregunta_informes.build(pregunta_inf: '¿Se logro realizar en el tiempo establecido?',respuesta: '' )
    #@informe.pregunta_informes.build(pregunta_inf: '¿Se logro el objetivo del evento/reunión?',respuesta: '' )
    #@informe.pregunta_informes.build(pregunta_inf: '¿Quedaron elemento a resolver?',respuesta: '' )
  end

  def create
    @informe = Informe.create(informe_params)
    @informe.user_id = current_user.id
    if current_user.rol == "Admin"
      @informe = Informe.create(informe_params)
      @informe.user_id = current_user.id
      if @informe.save
        @informe.save
        flash[:success] = "Informe Creado"
        redirect_to @informe
      else
        flash[:error] = "No se ha creado el informe"
        render :new
      end
    else
      @user = User.find_by(rol: "Admin")
      @informe = Informe.create(informe_params)
      @informe.user_id = current_user.id
      if @informe.save
        @informe = Informe.find_by(nombre_cues: @informe.nombre_cues, user_id: @user.id )
        @informe.save
        flash[:success] = "Informe Creado"
        redirect_to edit_informe_path(@informe.id)
      else
        flash[:error] = "No se ha creado el informe"
        render :new
      end
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
    params.require(:informe).permit(:nombre_inf, :user_id, pregunta_informes_attributes: [:id, :pregunta_inf, :respuesta])
  end
end


