class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  after_create { |admin| admin.send_reset_password_instructions }

  validates :email, presence: true
  validates :role, presence: true

  def password_required?
    new_record? ? false : super
  end

  def has_role?(role_title)
    role == role_title
  end
end
