require 'HTTParty'
require 'Nokogiri'
require 'byebug'
# require 'open-uri'
# require 'pry'

def mini_scraper
  url = 'https://garagesalefinder.com/block/sales/Chicago-IL/1234567/'
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

mini_scraper

class Scraper

  attr_accessor :parse_page

  def initialize
    doc = HTTParty.get("https://chicago.craigslist.org/search/gms?hasPic=1&search_distance=20&postal=60645&sale_date=all+dates")
    @parse_page ||= Nokogiri::HTML(doc)
  end

  def item_container
    parse_page.css(".rows")
  end

  def get_events
    item_container.children.map { |name| name.css("a").attr('href') && name.css("a").attr('href').value  }.compact.uniq
  end

  def url_collector
    scraper = Scraper.new
    raw_events = scraper.get_events
    render json: raw_events
  end
    # item_container.css("a").attr('href').value
  # names = parse_page.css(".grid-item-info").css(".product-name").css("p").children.map { |name| name.text  }.compact

  # prices = parse_page.css(".grid-item-info").css("product-price").css("span.local").children.map { |price| price.text  }.compact

  # def get_prices
  #   self.item_container.css(".product-price").css(".prices").css("span.local").children.map { |price| price.text  }.compact
  # end
# p self.item_container
# scraper = Scraper.new
# events = scraper.get_events
# # prices = scraper.get_prices
# p events
# p prices
# (0...prices.size).each do | index |
#   p "- - - index: #{index + 1} - - -"
#   p "Name: #{names[index]} | price: #{prices[index]}"
end