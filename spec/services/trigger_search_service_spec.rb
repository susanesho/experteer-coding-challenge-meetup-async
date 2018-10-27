require "rails_helper"

describe TriggerSearchService do
  context "#call" do
    let(:query) { "rails meet up" }
    let!(:trigger_search_service) { TriggerSearchService.new(query: query) }

    it "invokes the call method" do
      allow(trigger_search_service).to receive(:call)

      trigger_search_service.call

      expect(trigger_search_service).to have_received(:call)
    end
  end
end
