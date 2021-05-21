class Category < ApplicationRecord
  belongs_to :genre
  belongs_to :user_id
  has_many :details, dependent: :destroy
end
