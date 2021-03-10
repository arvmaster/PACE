class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new,:create]
  before_action :require_activated, except: [:new,:create]

  def index
    @user = User.where(:rol => "Admin")
    @users = User.all.where("id != ? and supervisar > ?", current_user.id, current_user.supervisar)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "User Creado"
      redirect_to estaticas_path
    else
      flash[:error] = "No se ha creado el user"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if user_signed_in?
        @user = User.find(params[:id])
        if params[:user][:password].blank? && params[:user][:password_confirmation].blank? && (current_user == @user || current_user.rol == "Admin")
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
        end
        if @user.update(user_params)
          flash[:success] = "Se actualizo el user"
          redirect_to users_url
        else
          flash[:error] = "No se modifico el user"
          render :edit
        end
    else
      flash[:error] = "No puedes realizar esta accion"
      redirect_to root_path
    end
  end

  #def inactivo
  #@user.destroy

  #  @user.estado = false
  #  @user.save
  #      redirect_to users_path, success: "Se ha desvinculado el usuario"
  #end

  def destroy
    User.find(params[:id]).destroy
  end

  def import
    User.import(params[:file])
    redirect_to users_path, notice: "Datos importados."
  end

  private

  def user_params
    params.require(:user).permit(:nombre_user, :rol, :supervisar, :apellido_pa, :apellido_ma, :rut, :fecha_nacimiento, :comuna, :direccion, :nivel_estudio, :fecha_ingreso, :especialidad, :telefono, :estado, :email, :estudio_id,:recinto_id,:password, :password_confirmation)
  end

  def require_activated
    if !current_user.estado?
      flash[:error]="Usuario no existe [401]"
      redirect_to root_path

    end
  end

end
