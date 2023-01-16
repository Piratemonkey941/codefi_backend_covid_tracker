# frozen_string_literal: true

require_relative "covid_tracker/version"
require_relative "cli.rb"

require_relative "country.rb"
require_relative "state.rb"

require_relative "scraper.rb"

module CovidTracker
  class Error < StandardError; end
  # Your code goes here...
end
