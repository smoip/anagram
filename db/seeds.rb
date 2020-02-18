seed_text = File.read("#{Rails.root}/db/seed_text.txt")
seed_text
  .gsub("\n", "")
  .downcase
  .gsub(/[^a-z]/, " ")
  .squish
  .split(" ")
  .each do |text|
    Word.create(text: text)
  end

