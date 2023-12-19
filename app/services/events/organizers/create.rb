module Events
  module Organizers
      class Create
      include Interactor::Organizer

      organize Addresses::Interactors::Create,
               Events::Interactors::Create
      end
  end
end