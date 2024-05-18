class EventsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create]

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

	def edit
	   @event = Event.find(params[:id])
	 end

	 def update
	   @event = Event.find(params[:id])

	   if @event.update(event_params)
	     redirect_to user_path(@event.creator)
	   else
	     render :edit, status: :unprocessable_entity
	   end
	 end

	 def destroy
	   @event = Event.find(params[:id])
	   @event.destroy

	   redirect_to root_path, status: :see_other
	 end

	private

  def event_params
    params.require(:event).permit(:location, :date, :creator_id)
  end

end
