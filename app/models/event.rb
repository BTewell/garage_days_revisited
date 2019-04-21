class Event < ApplicationRecord
  belongs to :user
  has_many :images
  has_many :items

  def items
    Item.where(event_id: id)
  end

  def images
    Image.where(event_id: id)
  end

  def friendly_start_date
    start_date.strftime('%a %b %e %Y')
  end

  def friendly_end_date
    end_date.strftime('%a %b %e %Y')
  end

  def friendly_start_time
    start_time.strftime('%l %M %p')
  end

  def friendly_end_time
    end_time.strftime('%l %M %p')
  end
end
