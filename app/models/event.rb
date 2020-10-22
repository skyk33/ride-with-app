class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  validates :title, :date, :prefecture, :meeting_point, :details, presence: true
  validates :prefecture_id, numericality: { other_than: 0, message: 'is not selected' }
end
