class User < ApplicationRecord
    validates :name, {presence:true}

    validates :email, {presence:true, uniqueness: true}

    validates :password, {presence:true}

    has_many :posts
    has_many :likes
    
end
