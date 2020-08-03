class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy
  # order discussion by most recent with scope
  default_scope -> {order(created_at: :desc)}
  validates_presence_of :user_id, :book_id
  validates :content, presence: true, length: {maximum: 500}

end
