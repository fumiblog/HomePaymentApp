class Category < ApplicationRecord
  belongs_to :genre
  has_many :details, dependent: :destroy
end
