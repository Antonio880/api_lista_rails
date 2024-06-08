class TarefasController < ApplicationController
    before_action :authenticate_request
    before_action :set_tarefa, only: %i[show update destroy]
  
    # GET /tarefas
    def index
      @tarefas = @current_user.tarefas
  
      render json: @tarefas
    end
  
    # GET /tarefas/1
    def show
      render json: @tarefa
    end
  
    # POST /tarefas
    def create
      result = CreateTarefa.call(usuario: @current_user, params: tarefa_params)
  
      if result.success?
        render json: result.tarefa, status: :created
      else
        render json: @tarefa.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /tarefas/1
    def update
      if @tarefa.update(tarefa_params)
        render json: @tarefa
      else
        render json: @tarefa.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /tarefas/1
    def destroy
      @tarefa.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tarefa
        @tarefa = @current_user.tarefas.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def tarefa_params
        params.require(:tarefa).permit(:titulo)
      end
  end
  