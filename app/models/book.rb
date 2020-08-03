class Book < ApplicationRecord
  has_many :discussions, dependent: :destroy
  has_many :users , through: :discussions
  has_many :comments, through: :discussions
  has_many :commented_users, through: :comments, source: :user
    validates_presence_of :title, :author

    def self.search(query)
      if query.present?
        query = query.titlecase
        self.all.where("lower(title) LIKE :search", search: "%#{query}%")
      else
        self
      end
        
    end

    def active_users
      ids = user_ids + commented_user_ids
      User.where(id: ids)
    end
    
end
