class Recipe < ActiveRecord::Base

  validates :title, :description, :instructions, :user_id, presence: true
  validates :title, length: { minimum: 10, maximum: 50 }

  belongs_to :user

  def difficulty
    return "Easy" if self.instructions.length < 100
    return "Hard" if self.instructions.length >= 400
  end
end
