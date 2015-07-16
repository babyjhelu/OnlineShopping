class Category < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  has_many :products
  delegate :name, to: :category_name, prefix: true

  validates :category_name, :description, presence: true,
            length: { minimum: 3 }

  validates :image, :format => {
      with: %r{\.gif|jpg|png|jpeg}i,
      message: 'Image must be gif, jpg, jpeg or png image.'

  }

end





