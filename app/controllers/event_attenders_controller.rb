class EventAttendersController < ApplicationController

	def new
		@event_attending = current_user.attended_events.first
	end

	def create
		attendee = current_user
		@event_attending = attendee.event_attendings.build(attendee_params)

		if @event_attending.save
			redirect_to event_attenders_path
		else
			render :new, status: :unprocessable_entity
		end	
	end

	private

	def attendee_params
	  params.require(:event_attending).permit(:attended_event_id)
	end
end
