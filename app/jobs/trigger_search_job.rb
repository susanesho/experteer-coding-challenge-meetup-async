class TriggerSearchJob < ApplicationJob
  queue_as :default

  def perform(query:)
  end
end