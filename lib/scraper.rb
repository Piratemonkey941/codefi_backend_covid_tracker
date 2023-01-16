require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative 'printable.rb'
require_relative 'country.rb'



class Scraper
    
    extend Printable::Format
    SCAPE_URL = "https://www.worldometers.info/coronavirus/country/us/"


    def self.scrape_usa
        doc = Nokogiri::HTML(URI.open("https://www.worldometers.info/coronavirus/country/us/"))
        usa_confirmed_cases = text_to_int(doc.css(".maincounter-number")[0].text)
        usa_overall_deaths  = text_to_int(doc.css(".maincounter-number")[1].text)
        usa_recoveries      = text_to_int(doc.css(".maincounter-number")[2].text)
        
        Country.new("USA", usa_confirmed_cases, usa_overall_deaths, usa_recoveries)
        binding.pry
    end

    def self.scrape_states

    end
end

binding.pry


# URI.open("https://www.worldometers.info/coronavirus/country/us/")
# Element:0x258
# children = [ #(Text "103,577,391        ")]

# doc.css(".maincounter-number")[0].text
# "\n        103,577,391        \n\n    "

# doc.css(".maincounter-number")[0].text.gsub(/[\s,]/, "").to_i
# 103577391