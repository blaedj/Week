class Week
  # starts on a monday
  attr_accessor :start_date

  def initialize
    @start_date = Date.new(2014, 10, 6)
  end

end
