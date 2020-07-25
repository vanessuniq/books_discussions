class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :discussion

  default_scope -> {order(created_at: :desc)}

  validates_presence_of :user, :discussion
  validates :content, presence: true, length: {maximum: 200}
end
