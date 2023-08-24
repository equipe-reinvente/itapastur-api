class EnterprisesController < ApplicationController
    before_action :authorize

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

    def enterprises
        enterprises = Enterprise.all
        render json: {enterprises: enterprises}
    end

    def user_enterprises
        user = User.find(params[:user_id])
        @enterprises = user.enterprises
        if @enterprises
            render json: {enterprises: @enterprises}, status: :ok
        else
            render json: {error: "Usuário não encontrado"}, status: :not_found
        end
    end

    def create
        @address = Address.new(address_params)

        if @address.save
            @enterprise = Enterprise.new(enterprise_params)
            @enterprise.user = User.find(params[:user_id])
            @enterprise.category = Category.find_by(name: params[:category])
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
        params.permit(:name, :description, :cellphone, :image_one, :image_two, :image_three)
    end
end
