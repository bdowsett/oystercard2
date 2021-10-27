require 'station'

describe Station do
    describe '#initialize' do
    it "is initialized with station name & Zone" do
        station = Station.new("Kings Cross", 1)
        expect(station.zone).to eq 1
        expect(station.name).to eq "Kings Cross"
    end 
end 

    
end