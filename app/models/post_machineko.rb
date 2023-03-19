class PostMachineko < ApplicationRecord
  has_one_attached :image

  belongs_to :end_user
  has_many :post_comments, dependent: :destroy
  
  def get_image
    image.variant(resize_to_limit: [640, 420]).processed
  end

end