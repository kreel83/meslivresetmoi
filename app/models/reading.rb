class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :livre
  has_many :reviews, dependent: :destroy
end
