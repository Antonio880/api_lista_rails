module Usuarios
    module Organizers
      class Search
        include Interactor::Organizer
  
        organize(
          Usuarios::Interactors::Search,
          Usuarios::Interactors::RegisterLog,
        )
      end
    end
  end
  