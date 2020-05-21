class Admin::NoticesController < Admin::Base
    
    def index
      @notice = Notice.all.order(id: :desc)
    end
    
    def new
      @notice = Notice.new 
    end
    
    def create
      @notice = Notice.new(admin_notice)
      if @notice.save
        flash[:success] = 'コメントを投稿しました。'
        redirect_to admin_notices_path
      else
      
      end
    end
    
    def destroy
      @notice.destroy
      flash[:success] = 'メッセージを削除しました。'
      redirect_to admin_notices_path
    end
    
    
    private

    def admin_notice
      params.permit(:content)
    end
    
end