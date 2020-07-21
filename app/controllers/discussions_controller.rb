class DiscussionsController < ApplicationController
    before_action :require_login, only: [:new, :create, :show, :index, :destroy]

    def index
        if params[:book_id] && Book.exists?(params[:book_id])
            @discussions = Book.find(params[:book_id]).discussions.paginate(page: params[:page], per_page: 15)
            
            if @discussions.nil?
                flash[:danger] = "There's no book with the given genre or no discusiion yet regarding books in selected genre"
                redirect_to discussions_path  
            end 
        else
            @discussions = Discussion.paginate(page: params[:page], per_page: 15)
            
        end
        
        
    end
    
    def new
        if params[:book_id] && !Book.exists?(params[:book_id])
            flash[:danger] = 'Book not found'
            redirect_to books_path
        else
           @discussion = Discussion.new(book_id: params[:book_id]) 
        end
    end

    def create
        @discussion = current_user.discussions.build(discussion_params)
        if @discussion.save
            flash[:success] = "Discussion successfully posted"
            redirect_to @discussion.book
        else
            flash.now[:danger] = 'Unable to post your discussion'
            render 'new'
        end
    end

    def show
        @discussion = Discussion.find_by(id: params[:id])
        if @discussion.nil?
            flash[:danger] = 'Discussion not found or has been deleted'
            redirect_to discussions_path
        end
    end

    def destroy
        
    end

    private

    def discussion_params
        params.require(:discussion).permit(:content, :book_id, :query)
    end
end
