class Sharing < ApplicationRecord
  belongs_to :user
  belongs_to :memory

  validates :token, presence: true

  before_validation :check_token
  before_validation :check_user

  private

  def check_token
    errors.add(:token, "is invalid") unless memory&.token == token
  end

  def check_user
    errors.add(:user, "can't be memory's owner") if user == memory&.user
  end
end
