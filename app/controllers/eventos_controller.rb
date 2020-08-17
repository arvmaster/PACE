class EventosController < ApplicationController
  before_action :authenticate_user!

  def index
    @eventos = Evento.all
  end

  def show
    @evento = Evento.find(params[:id])
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
      flash[:error] = "No se ha creado el evento"
      render :new
    end
  end

  def edit
    @evento = Evento.find(params[:id])
  end

  def update
    @evento = Evento.find(params[:id])
    if @evento.update(evento_params)
      flash[:success] = "Se actualizo el evento"
      redirect_to eventos_url
    else
      flash[:error] = "No se modifico el evento"
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
  
end
