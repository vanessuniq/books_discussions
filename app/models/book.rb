class Book < ApplicationRecord
    validates_presence_of :title, :author

    def self.filter(title, genre)
        if title.present? && genre.present?
          where(title: title, genre: genre)
        elsif title.present?
          where("TITLE like?", "%#{title}%")
          
        elsif genre.present?
          where("GENRE like?", "%#{genre}%")
        else
          self.paginate(page: params[:page])
        end
      end
    
end
