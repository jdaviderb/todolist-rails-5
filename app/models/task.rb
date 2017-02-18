class Task < ApplicationRecord
  #validations
  validates :description, presence: true
  #relations
  belongs_to :user
  
  def done!
    update done: true
  end

  def undone!
    update done: false
  end
end
