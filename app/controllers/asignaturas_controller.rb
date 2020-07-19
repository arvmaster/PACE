class AsignaturasController < ApplicationController
  def index
    @asignaturas = Asignaturas.all
  end
end
