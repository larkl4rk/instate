class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership!, only: [:update, :destroy]

  def create
    @post = Post.find_by(id: params[:post_id])
    new_comment = Comment.new(content: params[:content],
                              post_id: params[:post_id],
                              user_id: current_user.id)
    new_comment.save

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  private
  def check_ownership!
    @comment = Comment.find_by(id: params[:id])
    redirect_to root_path if @comment.user.id != current_user.id
  end
end
