class Answer < ActiveRecord::Base
  attr_accessor :content, :question_id
  belongs_to :question
end
