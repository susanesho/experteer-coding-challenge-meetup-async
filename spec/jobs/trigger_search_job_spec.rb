require 'rails_helper'

RSpec.describe TriggerSearchJob, type: :job do
  describe "#perform_" do
    it "calls the TriggerSearchService" do
      query = "rails meet up"
      meet_up_api = TriggerSearchService.new(query: query)

      allow(meet_up_api).to receive(:call)
      allow(TriggerSearchService).to receive(:new).and_return(meet_up_api)

      TriggerSearchJob.perform_now(query: query)

      expect(meet_up_api).to have_received(:call)
    end
  end
end
