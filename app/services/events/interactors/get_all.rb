module Events
  module Interactors
    class GetAll
      include Interactor

      def call
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
          context.all_events = all_events
        else
          context.fail!(message: "get_events_failure")
        end
      end 
    end 
  end
end