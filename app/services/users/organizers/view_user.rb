module Users
  module Organizers
      class ViewUser
      include Interactor::Organizer

      organize Enterprises::Interactors::GetUserEnterprises,
               Enterprises::Interactors::GetLikedEnterprises
      end
  end
end