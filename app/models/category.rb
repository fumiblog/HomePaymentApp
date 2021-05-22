class Category < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :details, dependent: :destroy
end
