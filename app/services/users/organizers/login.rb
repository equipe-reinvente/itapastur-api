module Users
  module Organizers
      class Login
      include Interactor::Organizer

      organize Users::Interactors::Authenticate,
               Tokens::Interactors::Encode,
               Enterprises::Interactors::GetUser,
               Enterprises::Interactors::GetLiked
      end
  end
end