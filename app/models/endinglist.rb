class Endinglist < ApplicationRecord
  has_many :endings, dependent: :destroy
end
