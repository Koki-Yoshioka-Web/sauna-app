class Question < ApplicationRecord
  belongs_to :post
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

end
