class WordLookup
  attr_reader :text, :success

  def self.execute(text:)
    service = new(text: text)
    service.create_if_found
    OpenStruct.new(success?: service.success)
  end

  def initialize(text:)
    @text = text
    @success = false
  end

  def create_if_found
    if lookup.present?
      Word.create!(text: text)
      @success = true
    end
  end

  def lookup
    # TODO: implement API lookup
  end
end
