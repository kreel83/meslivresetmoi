class Critere < ApplicationRecord
  belongs_to :category
  has_many :notes, dependent: :destroy
end
