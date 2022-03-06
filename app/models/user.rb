class User < ApplicationRecord

validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
             :presence => {message: "can't be blank"},
             :uniqueness => true

validates_presence_of :password_digest
has_secure_password
has_secure_token :auth_token
end
