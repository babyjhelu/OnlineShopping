class Category < ActiveRecord::Base

  require 'csv'

  mount_uploader :image, ImageUploader

  has_many :products, :dependent => :destroy
  delegate :name, to: :category_name, prefix: true
  accepts_nested_attributes_for :products, allow_destroy: true

  validates :category_name, :description, presence: true,
            length: { minimum: 3 }




  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |category|
        csv << category.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      category_hash = row.to_hash # exclude the price field
      category = Product.where(id: category_hash["id"])

      if category.count == 1
        category.first.update_attributes(category_hash.except("image")) # exclude the price field.
      else
        Category.create!(category_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
