require './week'

describe Week do
  before do
    @week = Week.new()
  end

  it "should start on a monday" do
    expect(@week.start_date.monday?).to be_true
  end


end
