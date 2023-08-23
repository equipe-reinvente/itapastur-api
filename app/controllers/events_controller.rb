class EventsController < ApplicationController
    before_action :authorize

    def create
        @address = Address.new(address_params)
        @enterprise = Enterprise.find(params[:enterprise_id])

        if @address.valid?
            @event = Event.new(event_params)
            @event.enterprise = @enteprise
            @event.address = @address

            @address.save
            @enterprise.save
    end
    
    private

    def event_params
        params.permit(:name, :date, :time, :description)
    end

    def address_params 
        params.permit(:street, :number, :neighborhood, :latitude, :longitude)
    end
end 
