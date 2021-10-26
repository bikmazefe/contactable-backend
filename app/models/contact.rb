class Contact < ApplicationRecord
  include EventLoggable
  
  belongs_to :user

  validates_presence_of :email, :phone, :first_name, :last_name
  validates :email, uniqueness: {
            scope: :user_id,
            message: "already exists in another contact.",
          }
end
