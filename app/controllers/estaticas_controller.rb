class EstaticasController < ApplicationController
  def home
    @eventos = Evento.last(3)
  end
  def index
  end
end
