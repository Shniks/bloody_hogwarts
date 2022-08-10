require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  it 'can compute average age of students' do
    (1..10).each do |i|
      Student.create!(name: "Rando #{i}", age: i, house: "House #{i}")
    end

    average_age = Student.all.average(:age)

    expect(Student.average_age).to eq(average_age)
  end

  it 'can arrange student names alphabetically' do
    student_1 = Student.create!(name: "Harry Potter", age: 15, house: "Slitherin")
    student_2 = Student.create!(name: "Paulie Paul", age: 14, house: "Bangin")
    student_3 = Student.create!(name: "Frodo Baggins", age: 19, house: "Mordor")

    expect(Student.alphabetical.first.name).to eq(student_3.name)
    expect(Student.alphabetical.last.name).to eq(student_2.name)
  end

end
