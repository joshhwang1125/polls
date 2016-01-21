# == Schema Information
#
# Table name: responses
#
#  id        :integer          not null, primary key
#  user_id   :integer
#  answer_id :integer
#

class Response < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :answer_id, :presence => true
  validates :answer_id, uniqueness: { scope: :user_id }

  belongs_to :user,
    :primary_key => :id,
    :foreign_key => :user_id

  belongs_to :answer,
    :primary_key => :id,
    :foreign_key => :answer_id

  has_one :question,
    through: :answer,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll
end
