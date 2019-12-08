class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :livre
  has_many :reviews, dependent: :destroy

  acts_as_taggable # Alias for acts_as_taggable_on :tags
end
