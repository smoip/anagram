class WordsController < ApplicationController
  def fetch_new
    anagrams = AnagramCalculator.execute(word: word)

    respond_to do |format|
      format.json do
        render json: AnagramsSerializer.serialize(anagrams)
      end
    end
  end

  private

  def word
    Word.play_length.sample
  end
end
