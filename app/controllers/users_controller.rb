class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new,:create]
  before_action :require_activated, except: [:new,:create]

  def index
    @user = User.where(:role => "Admin")
    @users = User.all.where("id != ? and superviser > ?", current_user.id, current_user.superviser)
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
    params.require(:user).permit(:name, :phone,
                                 :role, :superviser,
                                 :first_last_name,
                                 :second_last_name,
                                 :dni, :born_date,
                                 :commune, :address,
                                 :academic_level,
                                 :registration_date,
                                 :specialization_branch,
                                 :active, :email,
                                 :estudio_id, :recinto_id,
                                 :password, :password_confirmation)
  end

  def require_activated
    unless current_user.active?
      flash[:error] = "Usuario no existe [401]"
      redirect_to root_path
    end
  end

end
