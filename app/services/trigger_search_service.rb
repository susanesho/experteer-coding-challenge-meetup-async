class TriggerSearchService
  # This service is used for making a request to meetups api
  # it takes in a query and other optional argument
  include HTTParty

  base_uri "api.meetup.com"

  attr_reader :result

  LOCATION = "munich".freeze
  PUBLIC = "public".freeze
  PAGE = 10
  GROUP_URL = "/find/groups".freeze

  def initialize(query:)
    @response = []
    @options = { query: {
      location: LOCATION,
      page: PAGE,
      text: query, photo_host: PUBLIC, key: ENV["API_KEY"]
    } }
  end

  def call
    @result = self.class.get(GROUP_URL, @options).parsed_response
    nil
  end
end
