class Product < ActiveRecord::Base
  acts_as_votable

  mount_uploader :image, ImageUploader

  belongs_to :category, :dependent => :destroy
  delegate :name, to: :category_name, prefix: true
  accepts_nested_attributes_for :category, allow_destroy: true

  validates_presence_of :category

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

end
