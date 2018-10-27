require "rails_helper"

describe TriggerSearchJob do
  describe "#perform_" do
    let(:query) { "rails meet up" }
    let(:trigger_search) { TriggerSearch.new }
    let(:trigger_search_service) { TriggerSearchService.new(query: query) }

    context "when the key does not exist" do
      it "calls the TriggerSearchService" do
        allow(TriggerSearch).to receive(:new).and_return(trigger_search)
        allow(trigger_search).to receive(:find).and_return(nil)
        allow(trigger_search_service).to receive(:call)
        allow(TriggerSearchService).to receive(:new).and_return(trigger_search_service)

        TriggerSearchJob.perform_now(query: query)

        expect(trigger_search_service).to have_received(:call)
      end
    end

    context "when the key exist" do
      it "does not call the TriggerSearchService" do
        allow(TriggerSearch).to receive(:new).and_return(trigger_search)
        allow(trigger_search).to receive(:find).and_return(query)
        allow(trigger_search_service).to receive(:call)
        allow(TriggerSearchService).to receive(:new).and_return(trigger_search_service)

        TriggerSearchJob.perform_now(query: query)

        expect(trigger_search_service).not_to have_received(:call)
      end
    end
  end
end
