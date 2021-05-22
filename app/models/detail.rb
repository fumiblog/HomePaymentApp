class Detail < ApplicationRecord
  belongs_to :category
  belongs_to :user
  enum payment_method: {cash: 0, paypay: 1, credit: 2}
end
