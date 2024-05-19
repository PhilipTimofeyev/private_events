class EventAttendersController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :destroy]
	
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

	def destroy
	  @event_attending = EventAttending.where(destroy_params)
	  @event_attending.destroy_all

	  redirect_to root_path, status: :see_other
	end

	private

	def attendee_params
	  params.require(:event_attending).permit(:attended_event_id)
	end

	def destroy_params
		params.require(:event_attending).permit(:attendee_id, :attended_event_id)
	end
end
