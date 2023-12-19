class EventsController < ApplicationController
    before_action :authorize

    def create
        result = Events::Organizers::Create.call(address_params: address_params, event_params: event_params)

        if result.success?
            render json: result.event
        else
            render json: result.message
        end
    end
    
    def get_events
        result = Events::Interactors::GetAll.call()
        if result.success?
            render json: result.all_events
        else
            render json: result.message
        end
    end

    private

    def event_params
        params.permit(:name, :date, :time, :description, :image)
    end
end 
