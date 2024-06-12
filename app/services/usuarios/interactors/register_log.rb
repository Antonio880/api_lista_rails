module Usuarios
    module Interactors
      class RegisterLog
        include Interactor
  
        delegate :usuario, :term, to: :context
  
        def call
          Rails.logger.info("[INFO] A new search was made by '#{usuario}' with term '#{term}'")
        rescue StandardError => e
          Rails.logger.error(e.message)
          context.fail!(message: e.message)
        end
      end
    end
  end
  