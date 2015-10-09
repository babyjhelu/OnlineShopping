class Survey < ActiveRecord::Base
  # has_many :questions, :dependent => :destroy
  # accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  attr_accessor :name, :questions_attributes
  has_many :questions
  accepts_nested_attributes_for :questions

end
