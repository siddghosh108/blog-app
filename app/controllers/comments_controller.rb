# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @comment = @user.comments.create(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'Comment created successfully'
    else
      flash[:error] = 'Something went wrong.'
      puts @comment.errors.full_messages
      render :new
    end

    redirect_to user_post_path(params[:user_id], @comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end