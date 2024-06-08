class CreateUsuario
    include Interactor
  
    def call
      usuario = Usuario.new(context.params)
  
      if usuario.save
        context.usuario = usuario
      else
        context.fail!(error: usuario.errors.full_messages)
      end
    end
  end