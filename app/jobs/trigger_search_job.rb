class TriggerSearchJob < ApplicationJob
  queue_as :default

  def perform(query:)
    return if trigger_search.find(query).present?

    service = TriggerSearchService.new(query: query)
    service.call
    data = service.result

    trigger_search.query = query
    trigger_search.data = data
    trigger_search.save
  end

  def trigger_search
    @trigger_search ||= TriggerSearch.new
  end
end
