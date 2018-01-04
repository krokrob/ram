class Contact < ApplicationRecord
  belongs_to :user

  def name
    @name ||= "#{first_name} #{last_name}"
  end
end
