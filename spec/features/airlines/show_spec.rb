require 'rails_helper'

describe 'airline show page' do
  before(:each) do
    @airline1 = Airline.create!(name: "Southwest")
    @flight1 = @airline1.flights.create!(number: 100)
    @flight2 = @airline1.flights.create!(number: 200)
    @flight3 = @airline1.flights.create!(number: 300)
    @passenger1 = @flight1.passengers.create!(name: "Bob", age: 27)
    @passenger2 = @flight1.passengers.create!(name: "Cob", age: 13)
    @passenger3 = @flight1.passengers.create!(name: "Dob", age: 23)
    @passenger4 = @flight2.passengers.create!(name: "Eob", age: 12)
    @passenger5 = @flight2.passengers.create!(name: "Fob", age: 60)
    @passenger6 = @flight2.passengers.create!(name: "Gob", age: 52)
    @passenger7 = @flight3.passengers.create!(name: "Hob", age: 8)
    @passenger8 = @flight3.passengers.create!(name: "Iob", age: 11)
    @passenger9 = @flight3.passengers.create!(name: "Bob", age: 33)

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