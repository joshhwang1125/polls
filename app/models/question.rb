# == Schema Information
#
# Table name: questions
#
#  id      :integer          not null, primary key
#  text    :string
#  poll_id :integer
#

class Question < ActiveRecord::Base
  validates :poll_id, :presence => true
  validates :text, :presence => true

  has_many :answers,
    :primary_key => :id,
    :foreign_key => :question_id,
    :class_name => 'AnswerChoice'

  belongs_to :poll,
    :primary_key => :id,
    :foreign_key => :poll_id
end
