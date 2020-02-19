require "rails_helper"

RSpec.describe WordsController, type: :controller do
  describe "words#fetch_new" do
    let(:word) { create(:word, text: "plead") }
    let(:anagram_list) { %w(lead plea ale) }

    let(:service_response) do
      OpenStruct.new(
        original: word.text,
        anagrams: anagram_list, 
        success: true,
      )
    end

    it "fetches a word from the existing database" do
      expect(AnagramCalculator).to receive(:execute)
        .with(word: word) { service_response }

      get :fetch_new, format: :json

      parsed_response = JSON
        .parse(response.body)
        .with_indifferent_access

      expect(parsed_response.dig(:data, :attributes)).to eq(
        {
          "original" => word.text,
          "anagrams" => anagram_list, 
          "success" => true,
        },
      )
    end
  end
end
