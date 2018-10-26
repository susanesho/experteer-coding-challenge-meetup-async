class TriggerSearchJob < ApplicationJob
  queue_as :default

  def perform(query:)
    service = TriggerSearchService.new(query: query)
    service.call
    data = service.result
    TriggerSearch.new(query: query, data: data).save
  end
end