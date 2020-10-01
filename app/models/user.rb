class User < ApplicationRecord
    # name, email can't be blank
    validates :name, presence: true
    validates :email, presence: true
end
