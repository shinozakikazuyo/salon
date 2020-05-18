class Comment < ApplicationRecord
  #一対多
  belongs_to :recipe
  belongs_to :user
  
  #バリデーション
  validates :content, presence: true, length: { maximum: 255 }
  
  #一対多
  has_many :favorites
  has_many :users
end
