class Book < ApplicationRecord
  has_many :discussions, dependent: :destroy
  has_many :users, through: :discussion
    validates_presence_of :title, :author

    def self.search(query)
      if query.present?
        query = query.titlecase
        self.all.where("lower(title) LIKE :search", search: "%#{query}%")
      else
        self
      end
        
    end
    
end
