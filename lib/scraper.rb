require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative 'printable.rb'
require_relative 'country.rb'
require_relative 'state.rb'



class Scraper                                                                           # class for scraping COVID-19 data from a website
    
    extend Printable::Format
    SCRAPE_URL = "https://www.worldometers.info/coronavirus/country/us/"                # URL of the website to be scraped


    def self.scrape_usa                                                                 # scrapes the data for USA from the website
        puts "Scrapping U.S.A. COVID information.."
        doc = Nokogiri::HTML(URI.open(SCRAPE_URL))                                      # uses Nokogiri to open the website and parse the HTML
        usa_confirmed_cases = text_to_int(doc.css(".maincounter-number")[0].text)       # uses css selectors to target specific elements on the page
        usa_overall_deaths  = text_to_int(doc.css(".maincounter-number")[1].text)       # uses css selectors to target specific elements on the page
        usa_recoveries      = text_to_int(doc.css(".maincounter-number")[2].text)       # uses css selectors to target specific elements on the page
        
        Country.new("USA", usa_confirmed_cases, usa_overall_deaths, usa_recoveries)     # creates a new Country object with the scraped data
        # binding.pry
    end

    def self.scrape_states                                      # scrapes the data for states from the website
        puts "Scrapping U.S. State COVID information.."
        doc = Nokogiri::HTML(URI.open(SCRAPE_URL))              # uses Nokogiri to open the website and parse the HTML

        doc.css('tbody tr')[1..51].each do |state_row|          #loops through the rows of the table 

            row = state_row.css("td")                           #gets the data from each column of the row
            name = row[1].text.split(" ").join(" ")
            
            cases = text_to_int(row[2].text)                    #uses the method from the printable module to convert the string to int
            deaths = text_to_int(row[4].text)
            recoveries = text_to_int(row[6].text)

            if name != "District Of Columbia"                   #if the name of the state is not District of Columbia
                State.new(name, cases, deaths, recoveries)      #creates a new instance of the state class with the scraped data
            end
        end            
    end
    def self.scrape_information                                 #scrapes the data for USA and the states
        scrape_usa
        scrape_states
    end
end

Scraper.scrape_states