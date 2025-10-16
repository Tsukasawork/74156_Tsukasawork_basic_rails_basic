class CommentsController < ApplicationController
  def create
    comment = Board.find(params[:board_id]).comments.build(comment_params)
    if comment.save
      redirect_to board_path(comment.board), success: t('defaults.flash_message.created', item: Comment.model_name.human)
    else
      redirect_to board_path(comment.board), danger: t('defaults.flash_message.not_created', item: Comment.model_name.human)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
