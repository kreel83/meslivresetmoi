class Livre < ApplicationRecord
  has_many :readings, dependent: :destroy
  has_many :endings, dependent: :destroy

    acts_as_taggable # Alias for acts_as_taggable_on :tags

end
