class Word < ApplicationRecord
  MINIMUM_LENGTH = 3
  MINIMUM_BASE_LENGTH = 5

  validates :text, length: { minimum: MINIMUM_LENGTH }
  validate :only_alpha

  scope :play_length, -> { where("LENGTH(text) >= ?", MINIMUM_BASE_LENGTH) } 

  private

  def only_alpha
    return unless text =~ /[^a-z]/
    message = "text may only contain lowercase alpha characters"
    errors.add(:text, message)
  end
end
