class Sharing < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :memory

  has_secure_token
end
