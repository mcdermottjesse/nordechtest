class UniversitiesController < ApplicationController
  require "httparty"

  def return_parsed_response(url)
    HTTParty.get(url).parsed_response
  end

  def index
    threads = []

    parsed_response_canada = nil
    parsed_response_usa = nil

    canada_url = "http://universities.hipolabs.com/search?country=Canada"
    usa_url = "http://universities.hipolabs.com/search?country=United%20States"

    threads << Thread.new {
      parsed_response_canada = return_parsed_response(canada_url)
      parsed_response_usa = return_parsed_response(usa_url)
    }

    threads.each(&:join)

    @canada = parsed_response_canada
    @usa = parsed_response_usa

    if !University.exists?
      parsed_response_canada.map do |university|
        University.create(university_name: university["name"])
      end
    end
  end
end
