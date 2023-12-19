module Users
  module Organizers
      class ViewUser
      include Interactor::Organizer

      organize Enterprises::Interactors::GetUser,
               Enterprises::Interactors::GetLiked
      end
  end
end