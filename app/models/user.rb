class User < ApplicationRecord
    has_secure_password

    has_many :questions
    has_many :answers, through: :questions

    validates :username, presence: true
    validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, presence: true
end
