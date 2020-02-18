require "rails_helper"

RSpec.describe AnagramCalculator do
  min_count = described_class::MINIMUM_ANAGRAM_COUNT

  describe ".execute" do
    let(:word) { create(:word, text: "golfer") }

    before do
      anagram_list.each do |text|
        create(:word, text: text)
      end
    end
      
    context "when at least #{min_count} anagrams exist" do
      let(:anagram_list) do
        %w(forge gofer flog ergo frog)
      end

      it "returns a hash including anagram list and success status" do
        result = described_class.execute(word: word) 
        expect(result).to have_attributes(
          original: word.text,
          success: true,
        )
        expect(result.anagrams).to match_array(
          anagram_list,
        )
      end
    end

    context "when fewer than #{min_count} anagrams exist" do
      let(:anagram_list) do
        %w(forge gofer)
      end
      
      it "returns a hash with a failure status" do
        result = described_class.execute(word: word) 
        expect(result).to have_attributes(
          original: word.text,
          success: false,
        )
        expect(result.anagrams).to match_array(
          anagram_list,
        )
      end
    end
  end
end
