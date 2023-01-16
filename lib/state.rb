# class Country
#     attr_accessor :name, :confirmed_cases, :overall_deaths, :recoveries
#     @@records = []

#     def initialize(country_name, country_cases, country_deaths, country_recoveries)
#         @name = country_name
#         @confirmed_cases = country_cases
#         @overall_deaths = country_deaths
#         @recoveries = country_recoveries

#         @@records << self
#     end

#     #class method
#     def self.all
#         @@records
#     end
# end

#--------------------------------------------------------------

class State < Country

end

missouri = State.new("Missouri",'10', '0', '10')
puts State.all[0].name