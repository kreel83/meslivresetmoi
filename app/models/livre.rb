class Livre < ApplicationRecord
  has_many :readings, dependent: :destroy
  has_many :endings, dependent: :destroy
end
