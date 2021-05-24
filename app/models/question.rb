class Question < ApplicationRecord
  has_many :answers
  has_many :corrections
  belongs_to :user
end
