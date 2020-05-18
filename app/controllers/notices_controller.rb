class NoticesController < ApplicationController
  
  def show
    @notice = Notice.order(id: :desc).limit(1)
  end
  
end
