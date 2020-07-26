class UsersController < ApplicationController

  def index
    @users = User.all
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
      redirect_to users_path
    else
      flash[:error] = "No se ha creado el user"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Se actualizo el user"
      redirect_to users_url
    else
      flash[:error] = "No se modifico el user"
      render :edit
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

  private

  def user_params
    params.require(:user).permit(:nombre_user, :apellido_pa, :apellido_ma, :rut, :fecha_nacimiento, :comuna,:direccion, :nivel_estudio, :fecha_ingreso, :especialidad, :telefono, :estado, :email, :password, :password_confirmation)
  end

end
