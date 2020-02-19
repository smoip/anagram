FactoryBot.define do
  factory :word do
    text { "dessert" }
    after(:build) do |word|
      word.text_length = word.text.length if word.text_length.nil?
    end
  end
end
