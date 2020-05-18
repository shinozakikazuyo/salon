class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:show, :favorites]
  
  def show
    @favorites = Favorite.joins(:comment).select("comments.content, favorites.comment_id, favorites.user_id").order(id: :desc).page(params[:page])
    #@favorites = favorites.joins(:recipe).select("recipes.title, comments.content, favorites.user_id").order(id: :desc).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
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

  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
