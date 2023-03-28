class PostMachineko < ApplicationRecord
  has_one_attached :image

  belongs_to :end_user
  has_many :post_comments, -> { joins(:end_user).where('end_users.is_deleted = ?', false) }, dependent: :destroy
  has_many :favorites, -> { joins(:end_user).where('end_users.is_deleted = ?', false) }, dependent: :destroy

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end