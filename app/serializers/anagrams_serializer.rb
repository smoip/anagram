class AnagramsSerializer
  include JSONAPI::Serializer

  attribute :original
  attribute :anagrams
  attribute :success
end
