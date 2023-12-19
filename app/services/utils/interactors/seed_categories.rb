module Utils
  module Interactors
    class SeedCategories
      include Interactor 

      SECRET = "#K99@t3CO7Kn"

      delegate :secret, to: :context
      def call 
        if secret == SECRET:
          loja = Category.create(name: "Loja")
          ponto = Category.create(name: "Ponto Turístico")
          artesao = Category.create(name: "Artesão")

          context.loja = loja
          context.ponto = ponto
          context.artesao = artesao
        end
      end
    end
  end
end