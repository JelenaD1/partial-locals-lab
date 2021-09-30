# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "pry"
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(user_input)
    if user_input.empty?
      @students = Student.all
    else
      @students = Student.where("name like ?", "%#{user_input}%")

    end
  end 

 
end
