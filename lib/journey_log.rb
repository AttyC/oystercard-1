class JourneyLog

  attr_reader :entry_station, :exit_station

  def initialize(journey_class = Journey)
    @journey_class = journey_class
  end

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def complete?
    true if @entry_station && @exit_station
  end

  # def fare
  #   complete? ? Oystercard::MINIMUM_FARE : PENALTY_FARE
  # end

  def origin(entry_station)
    @entry_station = entry_station
  end

  def destination(exit_station)
    @exit_station = exit_station
  end

  private

  
end
