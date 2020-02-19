seed_text = File.read("#{Rails.root}/db/seed.txt")
seed_text
  .gsub("\n", " ")
  .downcase
  .gsub(/[^a-z]/, " ")
  .squish
  .split(" ")
  .each do |text|
    Word.create(text: text, text_length: text.length)
  end

