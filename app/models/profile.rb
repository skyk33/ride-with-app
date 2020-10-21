class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  validates :nickname, presence: true, length: { minimum: 4, maximum: 15 }, uniqueness: { case_sensitive: true }, format: { with: /\A[a-zA-Z0-9]+\z/i, message: '半角英数字のみ利用可能です' }
end
