class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:show, :favorites]
  
  def show
    @favorites = Favorite.includes(comment: :recipe).joins(comment: :recipe).select("comments.content, favorites.comment_id, favorites.user_id, recipes.title").order(id: :desc).page(params[:page])
    redirect_to recipes_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  #お気に入り機能
  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorites.page(params[:page])
  end
  
  def likes
    @favorites = Favorite.includes(comment: :recipe).joins(comment: :recipe).select("comments.content, favorites.comment_id, favorites.user_id, recipes.title").order(id: :desc).page(params[:page])
    render :show
  end

  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
