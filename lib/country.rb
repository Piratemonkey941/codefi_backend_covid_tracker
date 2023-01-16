class Country
    attr_accessor :name, :confirmed_cases, :overall_deaths, :recoveries
    @@records = []

    def initialize(country_name, country_cases, country_deaths, country_recoveries)
        @name = country_name
        @confirmed_cases = country_cases
        @overall_deaths = country_deaths
        @recoveries = country_recoveries

        @@records << self
    end

    #class method
    def self.all
        @@records
    end
end

usa = Country.new("USA", '10', '0', '10')

puts "There are this many cases in the USA" + usa.confirmed_cases

puts Country.all
    
#German needs to tell us to run the lib/country.rb