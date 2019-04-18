class Api::EventsController < ApplicationController
  before_action :authenticate_user

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
      end_time: params[:end_time])
    @event.save

    render 'show.json.jbuilder'
  end

  def update
    the_id = params[:id]
    @event = Event.find_by(id: the_id)
    @event.title = params[:title] || @events.title
    @event.address = params[:address] || @event.address
    @event.details = params[:details] || @event.details
    @event.start_date = params[:start_date] || @event.start_date
    @event.end_date = params[:end_date] || @event.end_date    
    @event.start_time = params[:start_time] || @event.start_time
    @event.end_time = params[:end_time] || @event.end_time
    @event.save

    render 'show.json.jbuilder'
  end

  def destroy
    the_id = params[:id]
    @event = Event.find_by(id: the_id)
    @event.destroy
    render 'destroy.json.jbuilder'
  end
end