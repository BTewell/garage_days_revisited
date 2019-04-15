require 'HTTParty'
require 'Nokogiri'
require 'byebug'
# require 'open-uri'
# require 'pry'

def scraper
  url = 'https://garagesalefinder.com/block/sales/chicago-il/123456/'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  event_urls = Array.new
  event_lists = parsed_page.css('div.record')
  event_lists.each do |event_lists|
    event_url = {
      url: event_lists.css('div.small-10').css('div.row.collapse').css('div.sale-actions').css('a.sale-url').attr('href').value
    }
    event_urls << event_url
    event_urls = event_urls.uniq
  end
  event_urls_v = event_urls.map{ |hash| hash.values }.flatten  
  event_data = Array.new
  event_urls_v.each do |each_url|
    unparsed_page_url = HTTParty.get(each_url)
    parsed_page_url = Nokogiri::HTML(unparsed_page_url)

    event = {
  #   #   # name: parsed_page_url.css('#container > div.sale-content-wrap > section > div > div:nth-child(2) > div:nth-child(1) > div.small-9.columns > h2'),
  #   #   # address: parsed_page_url.css('#container > div.sale-content-wrap > section > div > div:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div > div.small-12.medium-7.columns > div.sale-dates > h1'),
       address: parsed_page_url.css('#container').css('div.sale-content-wrap').css('section.row.sale-content').css('div.small-12.columns').children[3].children[3].children[3].children[3].children[1].text    
    }
    event_data << event
  end
  byebug
end

scraper
