class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :livre


  acts_as_taggable # Alias for acts_as_taggable_on :tags
end
