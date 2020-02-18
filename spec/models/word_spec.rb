require "rails_helper"

RSpec.describe Word, type: :model do
  describe "validations" do
    describe "text length" do
      min_length = described_class::MINIMUM_LENGTH

      context "less than #{min_length} characters" do
        it "is invalid" do
          expect(build(:word, text: "a" * (min_length - 1))).to be_invalid
        end
      end

      context "#{min_length} or more characters" do
        it "is valid" do
          expect(build(:word, text: "a" * min_length)).to be_valid
        end
      end
    end

    describe "text content" do
      context "with prohibited characters" do
        [
          "no pe",
          "n0pe",
          "NOPE",
          "nope!",
        ].each do |text|
          it "is invalid" do
            expect(build(:word, text: text)).to be_invalid
          end
        end
      end
    end
  end
end
