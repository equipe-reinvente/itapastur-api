class CategoriesController < ApplicationController
    before_action :authorize
    
    def create
        result = Categories::Interactors::Create.call(category_params: category_params)

        if result.success?
            render json: result.category
        else
            render json: result.message
        end
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end
end
