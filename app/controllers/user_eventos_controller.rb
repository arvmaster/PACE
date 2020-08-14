class UserEventosController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_eventos = UserEvento.all
  end

  def show
    @user_evento = UserEvento.find(params[:id])
  end

  def new
    @user_evento = UserEvento.new
  end

  def create
    @user_evento = UserEvento.create(user_evento_params)
    if @user_evento.save
      flash[:success] = "UserEvento Creado"
      redirect_to @user_evento
    else
      flash[:error] = "No se ha creado el user_evento"
      render :new
    end
  end

  def edit
    @user_evento = UserEvento.find(params[:id])
  end

  def update
    @user_evento = UserEvento.find(params[:id])
    if @user_evento.update(user_evento_params)
      flash[:success] = "Se actualizo el user_evento"
      redirect_to user_eventos_url
    else
      flash[:error] = "No se modifico el user_evento"
      render :edit
    end
  end


  #def inactivo
  # @user_evento.destroy

  # @user_evento.estado = false
  # @user_evento.save
  #      redirect_to user_eventos_path, success: "Se ha desvinculado el usuario"
  #end


  def destroy
    UserEvento.find(params[:id]).destroy
  end

  private

  def user_evento_params
    params.require(:user_evento).permit(:user_id, :evento_id, :asiste)
  end

end
