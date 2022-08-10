require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  it 'can arrange courses alphabetically' do
    student_1 = Student.create!(name: "Harry Potter", age: 15, house: "Slitherin")
    student_2 = Student.create!(name: "Paulie Paul", age: 14, house: "Bangin")
    student_3 = Student.create!(name: "Frodo Baggins", age: 14, house: "Mordor")
    student_4 = Student.create!(name: "Gandalf", age: 14, house: "Moria")

    course_1 = Course.create!(name: "Wizardry")
    course_2 = Course.create!(name: "Herbology")
    course_3 = Course.create!(name: "Defense against the Dark Arts")

    StudentCourse.create!(student_id: student_1.id, course_id: course_1.id)
    StudentCourse.create!(student_id: student_2.id, course_id: course_1.id)
    StudentCourse.create!(student_id: student_4.id, course_id: course_1.id)
    StudentCourse.create!(student_id: student_2.id, course_id: course_2.id)
    StudentCourse.create!(student_id: student_3.id, course_id: course_2.id)
    StudentCourse.create!(student_id: student_3.id, course_id: course_3.id)
    StudentCourse.create!(student_id: student_4.id, course_id: course_3.id)

    expect(Course.alphabetical.first.name).to eq(course_3.name)
    expect(Course.alphabetical.last.name).to eq(course_1.name)
  end

end
