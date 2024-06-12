module Usuarios
  module Interactors
    class Search
      include Interactor
  
      delegate :term, to: :context
  
      def call
        context.usuarios = search_user
      rescue StandardError => e
        Rails.logger.error(e.message)
        context.fail!(message: e.message)
      end
  
      private
  
      def search_user
        search_params = {}
        search_params = "lower(username) LIKE '%#{term.downcase}%'" if term.present?
  
        Usuario.where(search_params)
      end
  
    end
  end
end
  