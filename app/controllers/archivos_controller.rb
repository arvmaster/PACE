class ArchivosController < ApplicationController

    def index
      @archivos = Archivo.all
    end

    def show
      @archivo = Archivo.find(params[:id])
    end

    def new
      @archivo = Archivo.new
    end

    def create
      @archivo = Archivo.create(archivo_params)
      if @archivo.save
        flash[:success] = "Archivo Creado"
        redirect_to @archivo
      else
        flash[:error] = "No se ha creado el archivo"
        render :new
      end
    end

    def edit
      @archivo = Archivo.find(params[:id])
    end

    def update
      @archivo = Archivo.find(params[:id])
      if @archivo.update(archivo_params)
        flash[:success] = "Se actualizo el archivo"
        redirect_to archivos_url
      else
        flash[:error] = "No se modifico el archivo"
        render :edit
      end
    end

    #def inactivo
    #@archivo.destroy

    #  @archivo.estado = false
    #  @archivo.save
    #      redirect_to archivos_path, success: "Se ha desvinculado el usuario"
    #end

    def destroy
      Archivo.find(params[:id]).destroy
    end

    private

    def archivo_params
      params.require(:archivo).permit(:nombrearchivo, :asignatura_id, :estado)
    end

end
