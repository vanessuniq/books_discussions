class CommentsController < ApplicationController
  before_action :require_login
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @discussion = @comment.discussion
    if @comment.save
      flash[:success] = "Comment successfully posted"
      redirect_to @discussion
    else
      flash[:danger] = "Unable to post your comment, #{@comment.errors.full_messages.first}"
      redirect_to @discussion
      
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = "Comment successfully updated"
      redirect_to @comment.discussion
    else
      #flash.now[:danger] = 'Unable to update your comment'
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || @discussion
  end

  private

    def comment_params
        params.require(:comment).permit(:content, :discussion_id)
    end

    # validate current user
    def correct_user
        @discussion = Discussion.find_by(id: params[:discussion_id])
        if @discussion.nil?
          flash[:danger] = 'The discussion you are looking for does not exist or has been delete'
          redirect_to discussions_path
        else
          @comment = current_user.comments.find_by(id: params[:id])
          if @comment.nil?
            flash[:danger] = 'Unable to delete comment'
            redirect_to @discussion
          end
        end   
    
    end
end
