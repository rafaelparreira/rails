class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, :email, :password, :password_confirmation, presence: true 
  validates :email, uniqueness: true 
  belongs_to :expense, :optional => true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
