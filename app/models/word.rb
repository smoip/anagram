class Word < ApplicationRecord
  validates :text, length: { minimum: 4 }
end
