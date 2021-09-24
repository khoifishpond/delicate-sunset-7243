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
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
    expect(page).to have_content(@flight3.number)
    expect(page).to have_content(@airline1.name)
    expect(page).to have_content(@airline2.name)
    expect(page).to have_content(@airline3.name)
    expect(page).to have_content(@passenger1.name)
    expect(page).to have_content(@passenger2.name)
    expect(page).to have_content(@passenger3.name)
    expect(page).to have_content(@passenger4.name)
    expect(page).to have_content(@passenger5.name)
    expect(page).to have_content(@passenger6.name)
    expect(page).to have_content(@passenger7.name)
    expect(page).to have_content(@passenger8.name)
    expect(page).to have_content(@passenger9.name)
  end

  it 'has a link or button that removes a passenger from a flight' do
    within("#passenger-#{@passenger1.id}") do
      expect(page).to have_button("Remove #{@passenger1.name}")
      click_button "Remove #{@passenger1.name}"
    end
    
    expect(current_path).to eq(flights_path)
    expect(page).to_not have_content(@passenger1.name)
  end
end