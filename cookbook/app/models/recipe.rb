class Recipe < ActiveRecord::Base

  validates :title, :description, :instructions, presence: true
  validates :title, length: { minimum: 10, maximum: 50 }

  def difficulty
    return "Easy" if self.instructions.length < 100
    return "Hard" if self.instructions.length >= 400
  end
end
