class AnagramCalculator
  MINIMUM_ANAGRAM_COUNT = 3

  attr_reader :word

  def self.execute(word:)
    service = new(word: word)
    OpenStruct.new(
      original: word.text,
      anagrams: service.anagrams, 
      success: service.success?,
    )
  end

  def initialize(word:)
    @word = word
  end

  def anagrams
    @anagrams ||= calculate
  end

  def calculate
    persisted, unknown = permutations
      .reject { |permutation| permutation == word.text }
      .partition { |permutation| Word.where(text: permutation).present? }

    new_additions = unknown
      .select { |permutation| WordLookup.execute(text: permutation).success? }

    persisted + new_additions
  end

  def permutations
    (Word::MINIMUM_LENGTH..word.text.length).map do |perm_length|
      word
        .text
        .chars
        .permutation(perm_length)
        .to_a
        .map(&:join)
    end
      .flatten
  end

  def success?
    @anagrams.length >= MINIMUM_ANAGRAM_COUNT
  end
end
