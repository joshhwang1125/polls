# == Schema Information
#
# Table name: users
#
#  id        :integer          not null, primary key
#  user_name :string
#

class User < ActiveRecord::Base
  validates :user_name, :presence => true, :uniqueness => true

  has_many :authored_polls,
    :primary_key => :id,
    :foreign_key => :author_id

  has_many :responses,
    :primary_key => :id,
    :foreign_key => :user_id
end
