require "rails_helper"

RSpec.describe Word, type: :model do
  describe "validations" do
    describe "length" do
      context "less than four characters" do
        it "is invalid" do
          expect(described_class.new(text: "hi")).to be_invalid
        end
      end

      context "four or more characters" do
        it "is valid" do
          expect(described_class.new(text: "flop")).to be_valid
        end
      end
    end
  end
end
