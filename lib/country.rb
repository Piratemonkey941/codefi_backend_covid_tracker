class Country
    attr_accessor :name, :confirmed_cases, :overall_deaths, :recoveries                 #creating accessors for the instance variables
    @@records = []                                                                      # class variable to store all the instances of the class

    def initialize(country_name, country_cases, country_deaths, country_recoveries)     # Assigning instance variables with the passed values
        @name = country_name
        @confirmed_cases = country_cases
        @overall_deaths = country_deaths
        @recoveries = country_recoveries

        @@records << self                                                               # adding the current instance to the class variable
    end

    def self.all        # class method to access all instances of the class
        @@records
    end
end

puts Country.all        # This line prints all the instances of the class
                            
