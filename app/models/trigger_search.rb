class TriggerSearch
  def initialize(data: {}, query: nil, storage: $redis)
    @query = query
    @data = data
    @storage = storage
  end

  def save
    storage.set(storage_key, data.to_json)
  end

  def find(query)
    self.query = query
    storage.get(storage_key)
  end

  private

  attr_reader :storage, :data
  attr_accessor :query

  def storage_key
    # remove all traces of whitespace
    query = @query.gsub(/\s+/, "")
    ["meetup", query].join(":")
  end
end