class Event < ApplicationRecord
  has_many :images
  has_many :items

  def items
    Item.where(event_id: id)
  end

end
