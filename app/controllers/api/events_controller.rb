class Api::EventsController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_event_host, except: [:index, :create, :show]

  def index
    @events = Event.all
    render 'index.json.jbuilder'
  end

  def show
    @event = Event.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @event = Event.new(
      title: params[:title],
      address: params[:address],
      details: params[:details],
      start_date: params[:start_date],
      end_date: params[:end_date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      user_id: current_user.id
      )
    if @event.save
      render 'show.json.jbuilder'
    else
      render "errors.json.jbuilder", status: :unprocessible_entity  
    end
  end

  def update
    the_id = params[:id]
    @event = Event.find_by(id: the_id)
    @event.title = params[:title] || @event.title
    @event.address = params[:address] || @event.address
    @event.details = params[:details] || @event.details
    @event.start_date = params[:start_date] || @event.start_date
    @event.end_date = params[:end_date] || @event.end_date    
    @event.start_time = params[:start_time] || @event.start_time
    @event.end_time = params[:end_time] || @event.end_time
    if @event.save
      render 'show.json.jbuilder'
    else
      render "errors.json.jbuilder", status: :unprocessible_entity  
    end
  end

  def destroy
    the_id = params[:id]
    @event = Event.find_by(id: the_id)
    @event.destroy
    render 'destroy.json.jbuilder'
  end
end