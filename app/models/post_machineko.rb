class PostMachineko < ApplicationRecord
  has_one_attached :image

  belongs_to :end_user

  def get_image
    image.variant(resize_to_limit: [640, 420]).processed
  end

end