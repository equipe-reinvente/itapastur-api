class EnterprisesController < ApplicationController
    before_action :authorize

    def enterprise
        @enterprise = Enterprise.find(params[:enterprise_id])
        if @enterprise
            render json: {enterprise: @enterprise}, status: :ok
        else
            render json: {error: "Empresa não encontrada!"}, status: :not_found
        end
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
