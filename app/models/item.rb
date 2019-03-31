class Item < ApplicationRecord
  belongs_to :event
  has_many :images

  def images
    Image.where(item_id: id)
  end
end