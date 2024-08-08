class Post < ApplicationRecord

    belongs_to :user, optional: true
    validates :user_id, {presence: true}
  


    def user
return User.find_by(id: self.user_id)
    end

    
   
     
    has_many :questions, dependent: :destroy
       
    accepts_nested_attributes_for :questions, allow_destroy: true

    belongs_to :user
  has_many :likes, dependent: :destroy  

end
