class Category < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  has_many :products

  validates :category_name, :description, presence: true,
            length: { minimum: 5 }

  validates :image, :format => {
      with: %r{\.gif|jpg|png}i,
      message: 'Image must be gif, jpg, or png image.'
  }

end





