class Api::ItemsController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_event_host, except: [:index, :create, :show]
  def index
    @items = Item.all
    render 'index.json.jbuilder'
  end

  def show
    the_id = params[:id]
    @item = Item.find_by(id: the_id)
    render 'show.json.jbuilder'
  end

  def create
    @item = Item.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      event_id: params[:event_id],
      user_id: current_user.id
    )
    if @product.save
      render 'show.json.jbuilder'
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end

  def update
    the_id = params[:id]
    @item = Item.find_by(id: the_id)
    @item.name = params[:name] || @item.name
    @item.description = params[:description] || @item.description
    @item.price = params[:price] || @item.price
  end

  def destroy
    the_id = params[:id]
    @event = Item.find_by(id: the_id)
    @event.destroy
    render 'destroy.json.jbuilder'
  end
end
