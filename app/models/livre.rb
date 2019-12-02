class Livre < ApplicationRecord
  belongs_to :category
  has_many :readings, dependent: :destroy
  has_many :endings, dependent: :destroy
end
