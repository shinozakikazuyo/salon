class User < ApplicationRecord
  #パスワードを暗号化して保存
  has_secure_password
  #バリデーション
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_many :comments
  has_many :favorites
  
  #お気に入り登録
  has_many :favorite_comment, through: :favorites, source: :comment
  
  #お気に入り機能
  def favorite(comment)
    #登録済みかをチェックする
    favorites.find_or_create_by(comment_id: comment.id)
  end

  def unfavorite(comment)
    favorite = favorites.find_by(comment_id: comment.id)
    favorite.destroy if favorite
  end
  
  def favorite?(comment)
    self.favorite_comment.include?(comment)
  end
end
