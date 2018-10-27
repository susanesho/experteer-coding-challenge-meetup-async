class TriggerSearch
  # A Redis wrapper also used for storing, retrieving and expiring redis storage_key
  attr_accessor :data, :query, :exp

  def initialize(data: {}, query: nil, storage: $redis, exp: 5.minutes)
    @query = query
    @data = data
    @storage = storage
    @exp = exp
  end

  def save
    storage.set(storage_key, data.to_json, ex: exp)
  end

  def find(query)
    self.query = query
    storage.get(storage_key)
  end

  private

  attr_reader :storage

  def storage_key
    # remove all traces of whitespace
    query = @query.gsub(/\s+/, "")
    ["meetup", query].join(":")
  end
end
