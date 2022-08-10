class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses

  validates_presence_of :name, :age, :house
end
