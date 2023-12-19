module Enterprises
  module Interactors
    class GetByCategory
      include Interactor

      def call
        categories = {
          'Loja' => :lojas,
          'Ponto Turístico' => :pontos,
          'Artesão' => :artesoes
        }

        enterprises_by_category = {}
      
        categories.each do |category_name, category_key|
          enterprises = Enterprise.joins(:category).where(categories: { name: category_name })
      
          enterprises_data = enterprises.map do |enterprise|
            {
              id: enterprise.id,
              name: enterprise.name,
              description: enterprise.description,
              cellphone: enterprise.cellphone,
              user_id: enterprise.user_id,
              category: enterprise.category.name,
              image_one: enterprise.image_one.url,
              image_two: enterprise.image_two.url,
              image_three: enterprise.image_three.url,
              favorites: Favorite.where(enterprise_id: enterprise.id).count,
              address: {
                id: enterprise.address.id,
                street: enterprise.address.street,
                number: enterprise.address.number,
                neighborhood: enterprise.address.neighborhood,
                latitude: enterprise.address.latitude,
                longitude: enterprise.address.longitude
              }
            }
          end

          enterprises_by_category[category_key] = enterprises_data
        end

        context.enterprises_by_category = enterprises_by_category
      end
    end
  end
end