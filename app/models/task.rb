class Task < ApplicationRecord
  #validations
  validates :description, presence: true
  #relations
  belongs_to :user
end
