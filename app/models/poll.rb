# == Schema Information
#
# Table name: polls
#
#  id        :integer          not null, primary key
#  title     :string
#  author_id :integer
#

class Poll < ActiveRecord::Base
  validates :author_id, :presence => true
  validates :title, :presence => true

  has_many :questions,
    :primary_key => :id,
    :foreign_key => :poll_id

  belongs_to :author,
    :primary_key => :id,
    :foreign_key => :author_id,
    :class_name => 'User'
end
