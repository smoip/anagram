class Word < ApplicationRecord
  validates :text, length: { minimum: 4 }
  validate :only_alpha

  private

  def only_alpha
    return unless text =~ /[^a-z]/
    message = "text may only contain lowercase alpha characters"
    errors.add(:text, message)
  end
end
