class UserEventosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_activated

  def index
    @user_eventos = UserEvento.where(user_id: current_user.id)
  end

  def show
    @user_evento = UserEvento.find(params[:id])
  end

  def new
    @user_evento = UserEvento.new
    @eventos = Evento.where('fecha_ev >= ?',  Time.current)
  end

  def create
    @eventos = Evento.where('fecha_ev >= ?',  Time.current)
    @user_evento = UserEvento.create(user_evento_params)
    if @user_evento.save
      flash[:success] = "Te has inscrito al Evento"
      redirect_to user_eventos_path
    else
      flash[:error] = "No puso realizarse la acción"
      render new_user_evento_path
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
    flash[:success] = "Desincripción realizada"
    redirect_to user_eventos_path
  end

  private

  def user_evento_params
    params.require(:user_evento).permit(:user_id, :evento_id, :asiste)
  end
  def require_activated
    if !current_user.estado?
      flash[:error]="Usuario no existe [401]"
      redirect_to root_path

    end
  end

end
