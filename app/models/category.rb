class Category < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  validates :category_name, :description, presence: true,
            length: { minimum: 5 }

  validates :image, :format => {
      with: %r{\.gif|jpg|png}i,
      message: 'must be a url for gif, jpg, or png image.'
  }

end





