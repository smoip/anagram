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
    deduped_permutations = permutations.reject { |permutation| permutation == word.text }
    persisted = Word.where(
      text: deduped_permutations,
    ).pluck(:text)

    unknown = deduped_permutations - persisted

    new_additions = unknown
      .select { |permutation| WordLookup.execute(text: permutation).success? }

    Set.new(persisted + new_additions)
  end

  def permutations
    (min_permutation_length..word.text.length).map do |perm_length|
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

  private

  def min_permutation_length
    Word::MINIMUM_LENGTH - 1
  end
end
