class Event < ApplicationRecord
  belongs_to :user
  validates :title, :date, :region, :prefecture, :meeting_point, :details, presence: true
end
