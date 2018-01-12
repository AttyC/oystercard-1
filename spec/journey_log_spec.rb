require 'journey_log'

describe JourneyLog do
  subject(:journey_log) { described_class.new(journey_class)}
  let(:journey_class) { double :journey_class, new: journey }
  let(:journey) { double :journey }
  let (:entry_station) { double :entry_station }
  let (:exit_station) { double :exit_station }

  describe '#origin' do
    it 'stores the entry station' do
      journey_log.origin(entry_station)
      expect(journey_log.entry_station).to eq entry_station
    end
  end
  describe '#destination' do
    it 'stores the exit station' do
      journey_log.destination(exit_station)
      expect(journey_log.exit_station).to eq exit_station
    end
  end

  describe '#complete?' do
      it 'confirms journey complete when journey given a touch in and touch out station' do
        journey_log.origin(entry_station)
        journey_log.destination(exit_station)
        expect(journey_log).to be_complete
    end
    it 'confirms journey incomplete when only entry station provided' do
      journey_log.origin(entry_station)
      expect(journey_log  ).not_to be_complete
    end
  end
  # describe '#fare' do
  #   it 'returns the minimum fare' do
  #     journey.origin(entry_station)
  #     journey.destination(exit_station)
  #     expect(journey.fare).to eq Journey::MINIMUM_FARE
  #   end
  #   context 'when only one station in journey' do
  #     it 'returns the penalty fare' do
  #       journey.origin(entry_station)
  #       expect(journey.fare).to eq Journey::PENALTY_FARE
  #     end
  #   end
  # end
end
