class CategoriesController < ApplicationController
    before_action :authorize
    
    def create
        @category = Category.new(category_params)
        if @category.save
            render json: {category: @category}, status: :ok
        else
            render json: {error: "Erro na criação da categoria!"}, status: :unprocessable_entity
        end
    end

    private

    def category_params
        params.permit(:name)
    end
end
