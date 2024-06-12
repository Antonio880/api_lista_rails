class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[ show update destroy ]

  # GET /usuarios
  def index
    #search_params = params[:username].blank? ? {} : "lower(username) LIKE '%#{params[:username].downcase}%'"
    #@usuarios = Usuario.where(search_params)
    result = Usuarios::Organizers::Search.call(term: params[:username], username: "Antonio")

    if result.success?
      @usuarios = result.users
    else
      @usuarios = []
      Rails.logger.error(result.message)
    end

  end

  # GET /usuarios/1
  def show
    render json: @usuario
  end

  # POST /usuarios
  def create
    result = Usuarios::Create.call(params: usuario_params)

    if result.success?
      render json: result.usuario, status: :created, location: result.usuario
    else
      render json: { errors: result.error }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usuarios/1
def update
  Rails.logger.debug("Parametros recebidos para atualização: #{usuario_params.inspect}")
  if @usuario.update(usuario_params)
    render json: @usuario
  else
    render json: @usuario.errors, status: :unprocessable_entity
  end
end

  # DELETE /usuarios/1
  def destroy
    @usuario.destroy!
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:username, :email, :password)
  end
end