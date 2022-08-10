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

end
