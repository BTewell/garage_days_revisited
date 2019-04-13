require 'HTTParty'
require 'Nokogiri'
require 'byebug'
# require 'open-uri'
# require 'pry'

def scraper
  url = 'https://garagesalefinder.com/yard-sales/60645'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  event_urls = Array.new
  event_lists = parsed_page.css('#city-sale-list.sale-scroll-list')
  list_rows = event_lists.css('div.row').css('a.sale-url')
  list_rows.each do |list_rows|
    event_url = {
      url: list_rows.attr('href')
    }
    event_urls << event_url
    event_urls = event_urls.uniq
  end
  event_urls_v = event_urls.map{ |hash| hash.values }.flatten  
  event_data = Array.new
  # event_urls_v.each do |each_url|
    # p encoded_url = URI.encode(each_url)
  each_url = 'https://garagesalefinder.com/s/NloDN/1314-glenview-rd-glenview-il-60025'
  # p URI.parse(encoded_url)
  unparsed_page_url = HTTParty.get(each_url)
  p parsed_page_url = Nokogiri::HTML(unparsed_page_url)

  event = {
  # #   # name: parsed_page_url.css('#container > div.sale-content-wrap > section > div > div:nth-child(2) > div:nth-child(1) > div.small-9.columns > h2'),
  # #   # address: parsed_page_url.css('#container > div.sale-content-wrap > section > div > div:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div > div.small-12.medium-7.columns > div.sale-dates > h1'),
    address: parsed_page_url.css('#container').css('div.sale-content-wrap').css('section.row.sale-content').css('div.small-12.columns').children[3].children[3].children[3].children[3].children[1].text   
  }
  event_data << event
  # end
  byebug
end

scraper