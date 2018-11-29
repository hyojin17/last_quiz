class CommentsController < ApplicationController
    before_action :set_comment, only: [:destroy]
    before_action :authenticate_user!
    
    def create
        @comment = Comment.new(comment_params)
        @comment.content = params[:comment][:content]
        @comment.user = current_user
        @comment.save
        redirect_to @comment.commentable

    end
    
    def destroy
        @comment.destroy
        redirect_to @comment.commentable
        # redirect_to song_url(@song.id)
        # redirect_to song_url(@song)
        # redirect_to @song 이 세줄이 모두 같은 의미여서, redirect_to @comment.commentable과 같은 형태로 쓸 수 있다.
    end
    
    private
    def set_comment
        @comment = Comment.find params[:id]
    end
    
    def comment_params
       params.require(:comment).permit(:content, :commentable_id, :commentable_type) 
    end
end
