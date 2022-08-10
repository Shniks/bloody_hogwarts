class Course < ApplicationRecord
  has_many :student_courses
  has_many :students, through: :student_courses

  validates_presence_of :name

end
