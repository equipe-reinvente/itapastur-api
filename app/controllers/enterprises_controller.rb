class EnterprisesController < ApplicationController
    before_action :authorize

    def user_enterprises
      enterprises_data = []
    
      enterprises = Enterprise.where(user_id: params[:user_id])
    
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
            street: enterprise.address.street,
            number: enterprise.address.number,
            neighborhood: enterprise.address.neighborhood,
            latitude: enterprise.address.latitude,
            longitude: enterprise.address.longitude
          }
        }
        enterprises_data << enterprise_data
      end
    
      render json: { user_enterprises: enterprises_data }, status: :ok
    end

    def enterprises_by_category
        categories = {
          'Lojas' => :lojas,
          'Pontos Turísticos' => :pontos,
          'Artesões' => :artesoes
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
      
        render json: { enterprises: enterprises_by_category }, status: :ok
      end

    def create
        @address = Address.new(address_params)

        if @address.save
            @enterprise = Enterprise.new(enterprise_params)
            @enterprise.address = @address

            if @enterprise.save
                render json: {enterprise: @enterprise}, status: :ok
            else
                render json: {error: "Erro na requisição!"}, status: :unprocessable_entity
            end   
        else
            render json: {error: "Endereço inválido!"}, status: :unprocessable_entity
        end
    end

    private 

    def address_params 
        params.permit(:street, :number, :neighborhood, :latitude, :longitude)
    end

    def enterprise_params
        params.permit(:name, :description, :cellphone, :image_one, :image_two, :image_three, :category_id, :user_id)
    end
end
