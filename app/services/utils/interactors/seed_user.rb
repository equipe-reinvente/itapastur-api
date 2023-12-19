module Utils
  module Interactors
    class SeedUser
      include Interactor 

      SECRET = "#K99@t3CO7Kn"

      delegate :secret, to: :context
      def call 
        if secret == SECRET:
          master = User.create(name: "ItapasTur", email: "itapastur@gmail.com", password: "1234567890")

          context.master = master
        end
      end
    end
  end
end