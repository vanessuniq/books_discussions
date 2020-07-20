class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :book
  # order discussion by most recent with Proc
  default_scope -> {order(created_at: :desc)}
  validates_presence_of :user_id, :book_id
  validates :content, presence: true, length: {maximum: 500}
end
