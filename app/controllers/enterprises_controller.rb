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
        result = Enterprises::Interactors::GetByCategory.call()
      
        render json: { enterprises: result.enterprises_by_category }, status: :ok
      end

    def create
      result = Enterprises::Organizers::Create.call(enterprise_params: enterprise_params, address_params: address_params)

      if result.success?
        render json: result.enterprise
      else
        render json: result.message
      end
    end

    private 

    def enterprise_params
        params.permit(:name, :description, :cellphone, :image_one, :image_two, :image_three, :category_id, :user_id)
    end
end
