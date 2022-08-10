require 'rails_helper'

RSpec.describe 'When I visit the courses index' do
  it 'I see the number of students for each course' do

    student_1 = Student.create!(name: "Harry Potter", age: 15, house: "Slitherin")
    student_2 = Student.create!(name: "Paulie Paul", age: 14, house: "Bangin")
    student_3 = Student.create!(name: "Frodo Baggins", age: 14, house: "Mordor")
    student_4 = Student.create!(name: "Gandalf", age: 14, house: "Moria")

    course_1 = Course.create!(name: "Defense against the Dark Arts")
    course_2 = Course.create!(name: "Herbology")

    StudentCourse.create!(student_id: student_1.id, course_id: course_1.id)
    StudentCourse.create!(student_id: student_2.id, course_id: course_1.id)
    StudentCourse.create!(student_id: student_4.id, course_id: course_1.id)
    StudentCourse.create!(student_id: student_2.id, course_id: course_2.id)
    StudentCourse.create!(student_id: student_3.id, course_id: course_2.id)

    visit "/courses"

    expect(page).to have_content("Defense against the Dark Arts: 3")
    expect(page).to have_content("Herbology: 2")
  end
end
