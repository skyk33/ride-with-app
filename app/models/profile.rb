class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  validates :nickname, presence: true, length: { minimum: 2, maximum: 15 }, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/i, message: '半角英数字のみ利用可能です' }
end
