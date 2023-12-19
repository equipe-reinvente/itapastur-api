module Enterprises
  module Interactors
    class GetDetailedUserEnterprises
      include Interactor

      delegate :user_id, to: :context
      def call
        enterprises = Enterprise.where(user_id: user_id)
        user_enterprises = []

        enterprises.each do |enterprise|
          enterprise_data = {
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
          user_enterprises << enterprise_data
        end
        context.user_enterprises = user_enterprises
      end
    end
  end
end
