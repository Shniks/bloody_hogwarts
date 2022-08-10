require 'rails_helper'

RSpec.describe 'When I visit students path' do
  describe 'I see a list of students' do
    it 'I can see the name, age and house of each student' do

      10.times do |i|
        Student.create!(name: "Rando #{i}", age: (i), house: "House #{i}")
      end

      visit '/students'

      10.times do |i|
        within ".student_#{i}" do
          expect(page).to have_content("Name: Rando #{i}")
          expect(page).to have_content("Age: #{i}")
          expect(page).to have_content("House: House #{i}")
        end
      end
    end
  end
end
