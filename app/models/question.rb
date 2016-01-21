# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string
#  poll_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :poll_id, :presence => true
  validates :text, :presence => true

  has_many :answers,
    :primary_key => :id,
    :foreign_key => :question_id,
    :class_name => 'AnswerChoice'

  has_many :responses,
    through: :answers,
    source: :responses

  belongs_to :poll,
    :primary_key => :id,
    :foreign_key => :poll_id

  def title
    self.text
  end

  def results
    results_hash = {}
    the_answers = self.answers.includes(:responses)

    # the_answers = self.answers.joins(:responses)

    the_answers.each do |answer|
      results_hash[answer.text] = answer.responses.length
    end

    results_hash
  end
end
