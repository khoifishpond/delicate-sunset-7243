require 'rails_helper'

describe FlightPassenger do
  describe 'relationshps' do
    it { should belong_to(:flight) }
    it { should belong_to(:passenger) }
  end
end