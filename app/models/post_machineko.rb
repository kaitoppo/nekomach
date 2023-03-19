class PostMachineko < ApplicationRecord
  has_one_attached :image

  belongs_to :end_user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end
  
  def get_image
    image.variant(resize_to_limit: [640, 420]).processed
  end

end