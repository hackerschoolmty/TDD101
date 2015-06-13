class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, :username, presence: true
  validates :bio, length: { maximum: 300 }
  validates :username, format: { 
    with: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/,
    multiline: true,
    message: "Username must have at least 1 number and 1 upcase letter"
  }
  validates :username,  uniqueness: true
end
