require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative 'printable.rb'
require_relative 'country.rb'
require_relative 'state.rb'



class Scraper
    
    extend Printable::Format
    SCRAPE_URL = "https://www.worldometers.info/coronavirus/country/us/"


    def self.scrape_usa
        doc = Nokogiri::HTML(URI.open(SCRAPE_URL))
        usa_confirmed_cases = text_to_int(doc.css(".maincounter-number")[0].text)
        usa_overall_deaths  = text_to_int(doc.css(".maincounter-number")[1].text)
        usa_recoveries      = text_to_int(doc.css(".maincounter-number")[2].text)
        
        Country.new("USA", usa_confirmed_cases, usa_overall_deaths, usa_recoveries)
        # binding.pry
    end

    def self.scrape_states
        puts "Scrapping U.S. State information.."
        doc = Nokogiri::HTML(URI.open(SCRAPE_URL))

        doc.css('tbody tr')[1..51].each do |state_row|

            row = state_row.css("td")
            name = row[1].text.split(" ").join(" ")
            
            cases = text_to_int(row[2].text)
            deaths = text_to_int(row[4].text)
            recoveries = text_to_int(row[6].text)

            if name != "District Of Columbia"
                State.new(name, cases, deaths, recoveries)
            end
        end


            
        binding.pry
    end
end

Scraper.scrape_states


# URI.open("https://www.worldometers.info/coronavirus/country/us/")
# Element:0x258
# children = [ #(Text "103,577,391        ")]

# doc.css(".maincounter-number")[0].text
# "\n        103,577,391        \n\n    "

# doc.css(".maincounter-number")[0].text.gsub(/[\s,]/, "").to_i
# 103577391