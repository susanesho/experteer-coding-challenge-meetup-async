require "rails_helper"

describe MeetupsController do
  let(:query) { "arts" }

  describe "Meetups#search" do
    it "performs the search in a background job" do
      post :search, params: { query: query }

      expect(TriggerSearchJob).to receive(:perform_later).with(query: query)
      TriggerSearchJob.perform_later(query: query)
    end
  end
end
