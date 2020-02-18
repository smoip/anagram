class Word < ApplicationRecord
  MINIMUM_LENGTH = 4

  validates :text, length: { minimum: MINIMUM_LENGTH }
  validate :only_alpha

  private

  def only_alpha
    return unless text =~ /[^a-z]/
    message = "text may only contain lowercase alpha characters"
    errors.add(:text, message)
  end
end
