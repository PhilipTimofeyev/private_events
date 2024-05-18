class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		creator = current_user
		@event = creator.created_events.build(event_params)

		if @event.save
			redirect_to events_path
		else
			render :new, status: :unprocessable_entity
		end	
	end

	private

  def event_params
    params.require(:event).permit(:location, :date, :creator_id)
  end

end
