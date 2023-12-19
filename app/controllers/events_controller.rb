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
                    address_id: event.address.id,
                    street: event.address.street,
                    number: event.address.number,
                    neighborhood: event.address.neighborhood,
                    latitude: event.address.latitude,
                    longitude: event.address.longitude
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
end 
