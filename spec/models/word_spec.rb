require "rails_helper"

RSpec.describe Word, type: :model do
  describe "validations" do
    describe "text length" do
      context "less than four characters" do
        it "is invalid" do
          expect(build(:word, text: "hi")).to be_invalid
        end
      end

      context "four or more characters" do
        it "is valid" do
          expect(build(:word, text: "flop")).to be_valid
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
