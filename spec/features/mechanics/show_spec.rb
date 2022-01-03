require 'rails_helper'

RSpec.describe 'Mechanic show page' do

  it 'can show information about specific mechanic' do
    mechanic_1 = Mechanic.create!(name: 'Mechanic 1', years_experience: 4)
    mechanic_2 = Mechanic.create!(name: 'Mechanic 2', years_experience: 5)
    mechanic_3 = Mechanic.create!(name: 'Mechanic 3', years_experience: 6)

    ride_1 = Ride.create!(name: 'Ride 1', thrill_rating: '7', open: true)
    ride_2 = Ride.create!(name: 'Ride 2', thrill_rating: '8', open: true)
    ride_3 = Ride.create!(name: 'Ride 3', thrill_rating: '9', open: false)

    mr11 = MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_1.id)
    mr12 = MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_2.id)
    mr13 = MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_3.id)

    visit "/mechanics/#{mechanic_1.id}"
    expect(page).to have_content('Name: Mechanic 1')
    expect(page).to have_content('Years of experience: 4')


    expect(page).to have_content('Ride 1')
    expect(page).to have_content('Ride 2')
    expect(page).to_not have_content('Ride 3')

    # how to do this?
    #expect('Ride 2').to come_before('Ride 1')

  end

end
