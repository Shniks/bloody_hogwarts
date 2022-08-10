require 'rails_helper'

RSpec.describe 'When I visit a student show page' do
  it 'I see a list of student courses' do

    student_1 = Student.create!(name: "Harry Potter", age: 15, house: "Slitherin")
    student_2 = Student.create!(name: "Paulie Paul", age: 14, house: "Bangin")

    course_1 = Course.create!(name: "Defense against the Dark Arts")
    course_2 = Course.create!(name: "Herbology")
    course_3 = Course.create!(name: "Potions")
    course_4 = Course.create!(name: "Flying High")

    StudentCourse.create!(student_id: student_1.id, course_id: course_1.id)
    StudentCourse.create!(student_id: student_1.id, course_id: course_3.id)
    StudentCourse.create!(student_id: student_1.id, course_id: course_4.id)
    StudentCourse.create!(student_id: student_2.id, course_id: course_2.id)
    StudentCourse.create!(student_id: student_2.id, course_id: course_3.id)

    visit "/students/#{student_1.id}"

    expect(page).to have_content("Defense against the Dark Arts")
    expect(page).to have_content("Potions")
    expect(page).to have_content("Flying High")

    visit "/students/#{student_2.id}"

    expect(page).to have_content("Herbology")
    expect(page).to have_content("Potions")
  end
end
