json.array! @events.each do |event|
  json.partial! "event.json.jbuilder", event: event 
end