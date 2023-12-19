module Users
  module Organizers
      class Create
      include Interactor::Organizer

      organize Addresses::Interactors::Create,
               Enterprises::Interactors::Create
      end
  end
end