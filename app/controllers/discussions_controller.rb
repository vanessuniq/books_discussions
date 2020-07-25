class DiscussionsController < ApplicationController
    before_action :require_login, only: [:new, :create, :show, :index, :destroy]
    before_action :correct_user, only: :destroy

    def index
        if params[:book_id] && Book.exists?(params[:book_id])
            @discussions = Book.find(params[:book_id]).discussions.paginate(page: params[:page], per_page: 15)
            
            if @discussions.empty?
                flash[:danger] = "There's no discusiion yet regarding the selected book"
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
        else
            @comment = Comment.new(discussion_id: @discussion.id)
            @comments = @discussion.comments.paginate(page: params[:page], per_page: 5)
        end
    end

    def destroy
        @discussion.destroy
        flash[:success] = "Discussion deleted"
        redirect_to request.referrer || current_user
    end

    private

    def discussion_params
        params.require(:discussion).permit(:content, :book_id)
    end

    # validate current user
    def correct_user
        @discussion = current_user.discussions.find_by(id: params[:id])
        if @discussion.nil?
            flash[:danger] = 'Unable to delete discussion'
            redirect_to current_user
        end
    
    end
end
