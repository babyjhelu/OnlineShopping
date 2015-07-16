class Product < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :category
  delegate :name, to: :category_name, prefix: true

  validates_presence_of :category

end
