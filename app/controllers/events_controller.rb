class EventsController < ApplicationController
  def index
    @events = Event.order(event_date: :desc)
    @events= Event.where('category_id=?',params[:search]) if params[:search] 
  end

  def new
    @event = Event.new
  end
                                                                                                                                                                       
  def create
    @event = Event.create(event_params)
    if @event.valid?
      flash[:errors] = "Successfully Created Event"
      redirect_to events_path
    else  
      flash[:errors] = @event.errors.full_messages
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:errors] = "Successfully Updated Event"
      redirect_to event_path(@event)
    else  
      flash[:errors] = @event.errors.full_messages
      redirect_to edit_event_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:errors] = "Successfully Deleted Event"
      redirect_to events_path
    else  
      flash[:errors] = @event.errors.full_messages
      redirect_to new_event_path
    end
  end
  
  private
  def event_params
    params.require(:event).permit(:name, :description, :event_date, :myuser_id,:category_id)
  end

end
