module DiscussionsHelper
    # validate the presence of book_id in new discussion form
    def book_id_field(discussion)
        if discussion.book.nil? 
            select_tag "discussion[book_id]", options_from_collection_for_select(Book.all, :id, :title), include_blank: 'Must select a book'
        else
            hidden_field_tag "discussion[book_id]", discussion.book_id
        end
    end
end
