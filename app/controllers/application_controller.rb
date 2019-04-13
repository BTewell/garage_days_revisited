class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
end

class Scraper

  attr_accessor :parse_page

  def initialize
    doc = HTTParty.get("https://chicago.craigslist.org/search/gms?hasPic=1&search_distance=20&postal=60645&sale_date=all+dates")
    @parse_page ||= Nokogiri::HTML(doc)
  end
  # names = parse_page.css(".grid-item-info").css(".product-name").css("p").children.map { |name| name.text  }.compact

  # prices = parse_page.css(".grid-item-info").css("product-price").css("span.local").children.map { |price| price.text  }.compact
  def get_events
    item_container.children.map { |name| name.css("a").attr('href') && name.css("a").attr('href').value  }.compact
    # item_container.css("a").attr('href').value
  end

  # def get_prices
  #   self.item_container.css(".product-price").css(".prices").css("span.local").children.map { |price| price.text  }.compact
  # end


  def item_container
    parse_page.css(".rows")
  end


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
