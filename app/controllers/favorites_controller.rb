class FavoritesController < ApplicationController
  
  def create
    comment = Comment.find(params[:comment_id])
    if comment.user_id != current_user.id
      current_user.favorite(comment)
      flash[:success] = 'お気に入り登録しました。'
      redirect_to comments_path
    end
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    current_user.unfavorite(comment)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_to comments_path
  end
  
end
