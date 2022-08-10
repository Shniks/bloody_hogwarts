class Course < ApplicationRecord
  has_many :student_courses
  has_many :students, through: :student_courses

  validates_presence_of :name

  def student_count
    students.count
  end

  def self.alphabetical
    order(:name)
  end

end
