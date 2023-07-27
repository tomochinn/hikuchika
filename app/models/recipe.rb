class Recipe < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_one_attached :image
  
  # バリデーションチェック
  validates :image, presence: true
  validates :recipe_name, presence: true
  validates :genre_id, presence: true
  validates :serving, presence: true
  validates :cooking_time, presence: true
  validates :price, presence: true
  validates :ingredient, presence: true
  validates :recipe, presence: true
  validates :point, presence: true
  
  # get_imageメソッドを定義
  def get_image(width,height)
    # 画像が添付されていない場合
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # 画像が添付されている場合
    image.variant(resize_to_limit: [width,height]).processed
  end
  
  # 検索機能を定義
  # 検索方法分岐
    def self.looks(search, word)
      if search == "perfect_match"
        @recipe = Recipe.where("recipe_name LIKE?","#{word}")
      elsif search == "forward_match"
        @recipe = Recipe.where("recipe_name LIKE?","#{word}%")
      elsif search == "backward_match"
        @recipe = Recipe.where("recipe_name LIKE?","%#{word}")
      elsif search == "partial_match"
        @recipe = Recipe.where("recipe_name LIKE?","%#{word}%")
      else
        @recipe = Recipe.all
      end
    end
  
  # 保存機能を定義
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
