module Usuarios
  module Organizers
    class CreateUsuarioWithTarefa
      include Interactor::Organizer
      #Este Organizer foi feito apenas para saber que é possível organizar interactors para que sejam executados em sequência
      organize CreateUsuario, CreateTarefa
    end
  end

end