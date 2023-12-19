module Users
  module Organizers
      class Create
      include Interactor::Organizer

      organize Users::Interactors::Create,
               Tokens::Interactors::Encode
      end
  end
end