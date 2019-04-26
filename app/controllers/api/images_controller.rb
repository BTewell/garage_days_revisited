class Api::ImagesController < ApplicationController
  def create
    @image = Image.new(
      event_id: params[:event_id],
      item_id: params[:item_id],
      url: params[:url]
    )
    if @image.save
      render json: @image
    else
      render 'errors.json.jbuilder', status: :unprocessible_entity
    end
  end

  def destroy
    @image = Image.find_by(id: params[:id])
    @image.destroy
  end
end
