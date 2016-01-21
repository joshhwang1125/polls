# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  answer_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Response < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :answer_id, :presence => true
  validate :user_cannot_submit_multiple_answers
  validate :author_cannot_respond

  belongs_to :user,
    :primary_key => :id,
    :foreign_key => :user_id

  belongs_to :answer,
    :primary_key => :id,
    :foreign_key => :answer_id,
    class_name: "AnswerChoice"

  has_one :question,
    through: :answer,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  private
  def user_cannot_submit_multiple_answers
    unless self.question.responses.where(user_id: self.user_id).empty?
      errors[:user_id] << "This user has already answered this question."
    end
  end

  def author_cannot_respond
    answer = self.answer
    if answer.question.poll.author.id == self.user_id
      errors[:user_id] << "Author cannot respond to own poll."
    end
  end

  # def question_validation?
  #
  # end

end
