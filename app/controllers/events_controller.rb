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
    
    def get_events
        events = Event.all
        all_events = events.each do |event|
            {
                id: event.id,
                name: event.name,
                data: event.date,
                time: event.time,
                description: event.description,
                image: event.image.url,
                address: {
                    event.address.id,
                    event.address.street,
                    event.address.number,
                    event.address.neighborhood,
                    event.address.latitude,
                    event.address.longitude
                }
            }
        end

        if all_events
            render json: {events: all_events}, status: :ok
        else
            render json: {error: "Eventos não encontrados!"}, status: :not_found
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
