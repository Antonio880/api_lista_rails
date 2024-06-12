class Usuario < ApplicationRecord
  has_secure_password

  has_many :tarefas, dependent: :destroy
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def name_and_email
    "#{username} - #{email} - #{Date.current}"
  end

end


