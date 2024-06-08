class CreateTarefa
    include Interactor
  
    def call
      tarefa = context.usuario.tarefas.new(context.params)
  
      if tarefa.save
        context.tarefa = tarefa
      else
        context.fail!(error: tarefa.errors.full_messages)
      end
    end
  end