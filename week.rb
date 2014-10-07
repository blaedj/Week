class Week
  # starts on a monday
  attr_accessor :start_date, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday

  def initialize(date = Date.today)
    @start_date = find_monday(date)
    process_days
  end

  def find_monday date
    date.monday? ? date : find_monday(date - 1)
  end

  def process_days
   days = {:monday => 0, :tuesday => 1, :wednesday => 2, :thursday => 3, :friday => 4, :saturday => 5, :sunday => 6}
   days.each { |day, val| instance_variable_set("@#{day}", @start_date + val ) }
  end

end
