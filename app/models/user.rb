class User < ApplicationRecord
    before_save :downcase_email

    validates :username, presence: true, length: {minimum: 4}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :email, presence: true, length: {maximum: 250}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 8 }

    private

    def downcase_email
         self.email = self.email.downcase
    end
end
