class Memory < ApplicationRecord
  belongs_to :user
  has_many :memory_contacts
  has_many :contacts, through: :memory_contacts

  mount_uploader :photo, PhotoUploader
end
