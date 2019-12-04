class Critere < ApplicationRecord

  has_many :notes, dependent: :destroy
  acts_as_taggable #
end
