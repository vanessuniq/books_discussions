class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy
  # order discussion by most recent with scope
  default_scope -> {order(created_at: :desc)}
  validates_presence_of :user_id, :book_id
  validates :content, presence: true, length: {maximum: 500}

  # define the search on discussion index
  
  def self.filter(query)
    if query.present?
      query = query.titlecase
      Book.where(GENRE: query).first.try(:discussions)
    else
      self.paginate(page: params[:page], per_page: 15)
    end
  end
end
