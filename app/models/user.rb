class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :birthday
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字のみ及び英字、数字の両方が必要です' }
  end

  has_one :profile
  has_many :events

  def update_without_password(params)
    self.attributes = params
    result = save(validate: false)
    clean_up_passwords
    result
  end
end
