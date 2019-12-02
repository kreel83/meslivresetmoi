class Category < ApplicationRecord
  has_many :criteres, dependent: :destroy
end
