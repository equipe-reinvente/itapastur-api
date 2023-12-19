module Users
  module Organizers
      class Login
      include Interactor::Organizer

      organize Users::Interactors::Authenticate,
               Tokens::Interactors::Encode,
               Enterprises::Interactors::GetUserEnterprises,
               Enterprises::Interactors::GetLikedEnterprises
      end
  end
end