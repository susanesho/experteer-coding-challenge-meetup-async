require "rails_helper"

describe TriggerSearch do
  let(:storage) { $redis }

  describe "#save" do
    it "saves the data to redis" do
      meetup = TriggerSearch.new(query: "science",
                                 data: { "meetup": ["yes": "working"] }, storage: storage)

      meetup.save
      redis_value = storage.get("meetup:science")

      expect(redis_value).to eq({ "meetup": ["yes": "working"] }.to_json)
    end
  end

  describe "#find" do
    it "retrives the data stored using the query" do
      storage.set("meetup:arts", { data: [] }.to_json)
      meetup = TriggerSearch.new(data: { data: [] }.to_json, storage: storage)
      result = meetup.find("arts")

      expect(result).to eq({ data: [] }.to_json)
    end
  end
end
