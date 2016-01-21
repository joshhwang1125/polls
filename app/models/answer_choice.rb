# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  text        :string
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class AnswerChoice < ActiveRecord::Base
  validates :question_id, :presence => true
  validates :text, :presence => true

  has_many :responses,
    :primary_key => :id,
    :foreign_key => :answer_id

  belongs_to :question,
    :primary_key => :id,
    :foreign_key => :question_id
end
