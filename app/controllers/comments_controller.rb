class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @user = @comment.user
      ActionCable.server.broadcast 'comment_channel',
                                   content: @comment, user: @user, time: @comment.created_at.strftime('%m/%d %H:%M')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
