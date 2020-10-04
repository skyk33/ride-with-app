class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :nickname, presence: true
end
