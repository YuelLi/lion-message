class User < ApplicationRecord
    has_many :posts
    has_many :replies
    has_secure_password
end
