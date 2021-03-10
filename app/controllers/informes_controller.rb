class InformesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_activated
  before_action :require_PACE

  def index
    @admin = User.find_by(:rol => "Admin")
    @informes = Informe.where(:user_id => @admin.id)
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
  end

  def create
    user = current_user
    if user.rol == "Admin"
      @informe = Informe.create(informe_params)
      @informe.user_id = user.id
      if @informe.save
        flash[:success] = "Informe Creado"
        redirect_to @informe
      else
        flash[:error] = "No se ha creado el informe"
        render :new
      end
    else
      @user = User.find_by(rol: "Admin")
      @informe = Informe.find_by(nombre_inf: params[:informe][:nombre_inf], user_id: @user.id ).amoeba_dup
      @informe.user_id = user.id
      if @informe.save
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
  def require_activated
    if !current_user.estado?
      flash[:error]="Usuario no existe [401]"
      redirect_to root_path

    end
  end
  def require_PACE
    if current_user.rol=='Estudiante'
      flash[:error]="No esta autorizado para acceder a esta pagina"
      redirect_to estaticas_path
    end
  end
end


