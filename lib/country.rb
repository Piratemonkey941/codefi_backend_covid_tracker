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

puts Country.all

# usa = Country.new("USA", '10', '0', '10') #needed to be commented out

# puts "There are this many cases in the USA" + usa.confirmed_cases  #needed to be commented out
    
#German needs to tell us to run the lib/country.rb