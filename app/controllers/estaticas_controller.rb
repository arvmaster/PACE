class EstaticasController < ApplicationController
  def home
    @eventos = Evento.last(2)
  end
  def index
  end
end
