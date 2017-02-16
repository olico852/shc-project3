class Review < ApplicationRecord
  belongs_to :user
  belongs_to :owner, foreign_key: "transaction_id", class_name: "Transaction"
end
