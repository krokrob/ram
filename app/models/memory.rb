class Memory < ApplicationRecord
  belongs_to :user
  has_many :memory_contacts, dependent: :destroy
  has_many :contacts, through: :memory_contacts

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
