class ArchivosController < ApplicationController
    before_action :authenticate_user!, except: [:index,:show]
    before_action :require_activated, except: [:index,:show]
    before_action :require_PACE, except: [:index,:show]

    def index
      @archivos = Archivo.all
    end

    def show
      @archivo = Archivo.find(params[:id])
    end
    #para agregar el user_id directo (Agregar en params la foreign key)
    def new
      @archivo = current_user.archivos.build
    end
    #para agregar sin tener que llamar el id se puede crear asi
    def create
      @archivo = current_user.archivos.build(archivo_params)
      if @archivo.save
        flash[:success] = "Archivo Creado"
        redirect_to @archivo
      else
        flash[:error] = "No se ha creado el archivo"
        render 'new'
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
        render 'edit'
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
      params.require(:archivo).permit(:nombre_archivo, :topico, :asignatura, :file, :user_id)
    end
    def require_activated
      if !current_user.estado?
        flash[:error]="Usuario no existe [401]"
        redirect_to root_path

      end
    end
    def require_PACE
      if current_user.rol=='Estudiante'
        flash[:error]="No esta autorizado para acceder a esta pagina"
        redirect_to estaticas_path
      end
    end

end
