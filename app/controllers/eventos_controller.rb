class EventosController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :require_activated, except: [:index,:show]
  before_action :require_PACE ,except: [:index,:show]

  def index
    @eventos = Evento.all
  end

  def show
    @evento = Evento.find(params[:id])
    @user_eventos = UserEvento.where(evento_id: @evento.id, asiste: true)
  end

  def new
    @evento = Evento.new
  end

  def create
    @evento = Evento.create(evento_params)
    if @evento.save
      flash[:success] = "Evento Creado"
      redirect_to @evento
    else
      flash[:error] = "No se ha creado el Evento"
      render :new
    end
  end

  def edit
    @evento = Evento.find(params[:id])
  end

  def update
    @evento = Evento.find(params[:id])
    if @evento.update(evento_params)
      flash[:success] = "Se actualizo el Evento"
      redirect_to eventos_url
    else
      flash[:error] = "No se modifico el Evento"
      render :edit
    end
  end

  def destroy
    Evento.find(params[:id]).destroy
  end

  private

  def evento_params
    params.require(:evento).permit(:nombre_ev, :fecha_ev, :descripcion, :link_ev)
  end
  def require_activated
    if !current_user.active?
      flash[:error]="Usuario no existe [401]"
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
