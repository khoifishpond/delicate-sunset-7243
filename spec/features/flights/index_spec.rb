require 'rails_helper'

describe 'flights index page' do
  before(:each) do
    @airline1 = Airline.create!(name: "Southwest")
    @airline2 = Airline.create!(name: "Delta")
    @airline3 = Airline.create!(name: "Frontier")
    @flight1 = @airline1.flights.create!(number: 100)
    @flight2 = @airline2.flights.create!(number: 200)
    @flight3 = @airline3.flights.create!(number: 300)
    @passenger1 = @flight1.passengers.create!(name: "Bob", age: 27)
    @passenger2 = @flight1.passengers.create!(name: "Cob", age: 25)
    @passenger3 = @flight1.passengers.create!(name: "Dob", age: 37)
    @passenger4 = @flight2.passengers.create!(name: "Eob", age: 29)
    @passenger5 = @flight2.passengers.create!(name: "Fob", age: 60)
    @passenger6 = @flight2.passengers.create!(name: "Gob", age: 52)
    @passenger7 = @flight3.passengers.create!(name: "Hob", age: 42)
    @passenger8 = @flight3.passengers.create!(name: "Iob", age: 62)
    @passenger9 = @flight3.passengers.create!(name: "Job", age: 33)

    visit flights_path
  end
  
  it 'lists all flight attributes and current passengers' do
    save_and_open_page
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
    expect(page).to have_content(@flight3.number)
    expect(page).to have_content(@airline1.name)
    expect(page).to have_content(@airline2.name)
    expect(page).to have_content(@airline3.name)
  end
end