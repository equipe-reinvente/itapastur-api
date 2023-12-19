module Utils
  module Organizers
      class Seed
      include Interactor::Organizer

      organize Utils::Interactors::SeedCategories,
               Utils::Interactors::SeedUser,
               Utils::Interactors::SeedEnterprises,
      end
  end
end