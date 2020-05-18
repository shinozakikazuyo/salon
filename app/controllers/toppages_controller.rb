class ToppagesController < ApplicationController
  
  #デフォルトで自身のアクションを呼び出す
  def index
    if logged_in?
      redirect_to recipes_url
      
    else
      # @recent_notice = Notice.order(:created_at).first
    end
  end
  
end
