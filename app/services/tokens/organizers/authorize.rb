module Tokens
  module Organizers
      class Authorize
      include Interactor::Organizer

      organize Tokens::Interactors::Decode,
               Tokens::Interactors::AuthorizedUser
      end
  end
end