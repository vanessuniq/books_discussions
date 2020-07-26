class BooksController < ApplicationController
    before_action :require_login, only: :destroy
    before_action :admin_user, only: :destroy

    def index
       # @books = Book.all
       #@books = Book.filter(params[:title], params[:genre])
       #@books = Book.paginate(page: params[:page])
       @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 15)
       flash.now[:danger] = "No results matching your query" if @books.empty?
    end

    def show
        @book = Book.find_by(id: params[:id])
        redirect_to books_path unless @book
        @discussions = @book.discussions.paginate(page: params[:page], per_page: 5)
    end

    def destroy
        book = Book.find_by(params[:id])
        if book
            book.destroy
            flash[:success] = "#{book.title} successfully deleted"
      
        else
            flash[:danger] = 'Unable to delete the selected book'
        end
        redirect_to books_path
    end
end