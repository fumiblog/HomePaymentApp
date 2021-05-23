class Genre < ApplicationRecord
  has_many :categories, dependent: :destroy
  extend OrderAsSpecified
end
