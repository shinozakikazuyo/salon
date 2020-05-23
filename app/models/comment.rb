class Comment < ApplicationRecord
  #一対多
  belongs_to :recipe
  belongs_to :user
  
  #バリデーション
  validates :content, presence: true, length: { maximum: 255 }
  
  #一対多
  has_many :favorites, dependent: :destroy
  has_many :users
  
  def self.all_with_recipe
    # class method
    self.includes(:recipe).joins(:recipe).select("comments.id, recipes.title, comments.content, comments.user_id").order(id: :desc)
  end
  
  def self.search(search) 
    if search
      self.includes(:recipe).joins(:recipe).select("comments.id, recipes.title, comments.content, comments.user_id").order(id: :desc).where(['title LIKE ?', "%#{search}%"])
    else
      #全て表示。
      self.includes(:recipe).joins(:recipe).select("comments.id, recipes.title, comments.content, comments.user_id").order(id: :desc) 
    end
  end
  
end
