require 'rails_helper'

RSpec.describe 'When I visit students path' do
  describe 'I see a list of students' do
    it 'I can see the name, age and house of each student' do

      (1..10).each do |i|
        Student.create!(name: "Rando #{i}", age: i, house: "House #{i}")
      end

      visit '/students'

      (1..10).each do |i|
        within ".student_#{i}" do
          expect(page).to have_content("Name: Rando #{i}")
          expect(page).to have_content("Age: #{i}")
          expect(page).to have_content("House: House #{i}")
        end
      end
    end

    it 'I can see the average age of all students' do
      age = []
      (1..10).each do |i|
        Student.create!(name: "Rando #{i}", age: "#{rand(18..35)}", house: "House #{i}")
      end

      average_age = Student.all.average(:age)

      visit '/students'

      expect(page).to have_content("Average Age: #{average_age}")
    end
  end
end
