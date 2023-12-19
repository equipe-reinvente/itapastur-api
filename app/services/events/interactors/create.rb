module Events
  module Interactors
    class Create
      include Interactor

      delegate :address, :event_params, to: :context

      def call
        event = Event.new(event_params)
        event.address = address
        if event.save!
          context.event = event
        else
          context.fail!(message: "create_event_failure")
        end
      end 
    end 
  end
end