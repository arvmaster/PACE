class PreguntaInformesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_activated
  before_action :require_PACE

      def index
        @pregunta_informes = PreguntaInforme.all
      end

      def show
        @pregunta_informe = PreguntaInforme.find(params[:id])
      end

      def new
        @pregunta_informe = PreguntaInforme.new
      end

      def create
        @pregunta_informe = PreguntaInforme.create(pregunta_informe_params)
        if @pregunta_informe.save
          flash[:success] = "PreguntaInforme Creado"
          redirect_to @pregunta_informe
        else
          flash[:error] = "No se ha creado el pregunta_informe"
          render :new
        end
      end

      def edit
        @pregunta_informe = PreguntaInforme.find(params[:id])
      end

      def update
        @pregunta_informe = PreguntaInforme.find(params[:id])
        if @pregunta_informe.update(pregunta_informe_params)
          flash[:success] = "Se actualizo el pregunta_informe"
          redirect_to pregunta_informes_url
        else
          flash[:error] = "No se modifico el pregunta_informe"
          render :edit
        end
      end


      #def inactivo
      # @pregunta_informe.destroy

      # @pregunta_informe.estado = false
      # @pregunta_informe.save
      #      redirect_to pregunta_informes_path, success: "Se ha desvinculado el usuario"
      #end


      def destroy
        PreguntaInforme.find(params[:id]).destroy
      end

      private

      def pregunta_informe_params
        params.require(:pregunta_informe).permit(:pregunta_inf, :respuesta, :informe_id)
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
