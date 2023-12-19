class EnterprisesController < ApplicationController
    before_action :authorize

    def user_enterprises
      result = Enterprises::Interactors::GetUserDetailed.call(user_id: params[:user_id])
    
      render json: { user_enterprises: result.user_enterprises }, status: :ok
    end

    def destroy_enterprise
      result = Enterprises::Interactors::Destroy.call(enterprise_id: params[:enterprise_id])

      render json: result.message
    end

    def edit_enterprise
      result = Enterprises::Interactors::Update.call(enterprise_id: params[:enterprise_id],
                                                     address_params: address_params,
                                                     enterprise_params: enterprise_params)

      if result.success?
        render json: result.enterprise
      else
        render json: result.message
      end
    end

    def enterprises_by_category
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
