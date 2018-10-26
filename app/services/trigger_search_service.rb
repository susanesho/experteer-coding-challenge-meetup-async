class TriggerSearchService
  include HTTParty

  base_uri 'api.meetup.com'

  attr_reader :result

  LOCATION = "munich".freeze
  PUBLIC = "public".freeze
  PAGE = 10.freeze

  def initialize(query:)
    @response = []
    @options = { query: {
      location: LOCATION,
      page: PAGE,
      text: query, photo_host: PUBLIC, key: ENV["API_KEY"] } }
  end

  def call
    @result = self.class.get("/find/groups", @options).parsed_response
    nil
  end
end
