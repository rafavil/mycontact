class Contact < ActiveRecord::Base
  # add validations
  validates :name, :email, :phone, presence: true
end
