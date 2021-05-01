class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :loans
  has_many :books, through: :loans
  has_one_attached :avatar
  enum role: [ :user, :admin ]
  enum theme: [ :light, :dark ]       
  validates :firstName, :lastName, :username, presence: true


  def fullName()
    return self.firstName + " " + self.lastName
  end

  def active_admin?
    role == :admin
  end

end
