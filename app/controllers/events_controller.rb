class EventsController < ApplicationController
    before_action :authorize

    def create
        @address = Address.new(address_params)

        if @address.save
            @event = Event.new(event_params)
            @event.enterprise = Enterprise.find(params[:enterprise_id])
            @event.address = @address
            if @event.save
                render json: {event: @event}, status: :ok
            else
                render json: {error: @event.errors}, status: :unprocessable_entity
            end
        else
            render json: {error: "Erro ao salvar o endereço!"}, status: :unprocessable_entity
        end
    end
    
    private

    def event_params
        params.permit(:name, :date, :time, :description, :image)
    end

    def address_params 
        params.permit(:street, :number, :neighborhood, :latitude, :longitude)
    end
end 
