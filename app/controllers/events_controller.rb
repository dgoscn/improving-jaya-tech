class EventsController < ApplicationController
    
    def index
        if params[:issue_id]
          @events = Issue.find_by(number: params[:issue_id]).events
        else
          @events = Event.all
        end
    
        render json: @events
      end
    
    
      def create
        event_service = Events::Create.new(params)
        event_service.call
        if event_service.success?
          render json: event_service.result, status: :created
        else
          render json: {errors: event_service.errors}, status: :unprocessable_entity
        end
      end
end
