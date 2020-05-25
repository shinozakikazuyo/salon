class CommentsController < ApplicationController
  
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    #@comments = Comment.all_with_recipe.page(params[:page]).per(20)
    @comments = Comment.search(params[:search]).page(params[:page]).per(20)
    
    if @comments.empty?
      flash.now[:danger] = '検索結果はありませんでした。'
    else
      
    end
    
  end
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to comments_path
    else
      @comments = current_user.comments.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      redirect_to comments_path
    end
  end
  
  def destroy
    @comment.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def comment_params
    params.permit(:recipe_id, :content)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
  
end
