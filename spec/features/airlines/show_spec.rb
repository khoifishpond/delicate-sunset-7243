require 'rails_helper'

describe 'airline show page' do
  before(:each) do
    @airline1 = Airline.create!(name: "Southwest")
    @flight1 = @airline1.flights.create!(number: 100)
    @flight2 = @airline1.flights.create!(number: 200)
    @flight3 = @airline1.flights.create!(number: 300)
    @passenger1 = Passenger.create!(name: "Bob", age: 27)
    @passenger2 = Passenger.create!(name: "Cob", age: 13)
    @passenger3 = Passenger.create!(name: "Dob", age: 23)
    @passenger4 = Passenger.create!(name: "Eob", age: 12)
    @passenger5 = Passenger.create!(name: "Fob", age: 60)
    @passenger6 = Passenger.create!(name: "Gob", age: 52)
    @passenger7 = Passenger.create!(name: "Hob", age: 8)
    @passenger8 = Passenger.create!(name: "Iob", age: 11)
    @passenger9 = Passenger.create!(name: "Job", age: 33)
    FlightPassenger.create(passenger: @passenger1, flight: @flight1)
    FlightPassenger.create(passenger: @passenger2, flight: @flight1)
    FlightPassenger.create(passenger: @passenger3, flight: @flight1)
    FlightPassenger.create(passenger: @passenger4, flight: @flight1)
    FlightPassenger.create(passenger: @passenger5, flight: @flight1)
    FlightPassenger.create(passenger: @passenger6, flight: @flight1)
    FlightPassenger.create(passenger: @passenger6, flight: @flight2)
    FlightPassenger.create(passenger: @passenger7, flight: @flight1)
    FlightPassenger.create(passenger: @passenger8, flight: @flight1)
    FlightPassenger.create(passenger: @passenger9, flight: @flight1)
    FlightPassenger.create(passenger: @passenger9, flight: @flight2)
    FlightPassenger.create(passenger: @passenger9, flight: @flight3)

    visit airline_path(@airline1)
  end
  
  it 'lists unique, adult passengers with the airline' do
    expect(page).to have_content(@passenger1.name)
    expect(page).to have_content(@passenger3.name)
    expect(page).to have_content(@passenger5.name)
    expect(page).to have_content(@passenger6.name)
    expect(page).to have_content(@passenger9.name)
  end
end