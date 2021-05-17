class Detail < ApplicationRecord
  belongs_to :category
  enum payment_method: {cash: 0, paypay: 1, credit: 2}
end
