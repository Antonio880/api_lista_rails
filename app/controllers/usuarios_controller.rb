class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[ show update destroy ]

  # GET /usuarios
  def index
    @usuarios = Usuario.all
    render json: @usuarios
  end

  # GET /usuarios/1
  def show
    render json: @usuario
  end

  # POST /usuarios
  def create
    result = CreateUsuario.call(params: usuario_params)

    if result.success?
      render json: result.usuario, status: :created, location: result.usuario
    else
      render json: { errors: result.error }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usuarios/1
  def update
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