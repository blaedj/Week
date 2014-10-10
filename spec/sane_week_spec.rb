require './lib/sane_week'

describe Week do


  describe "when initialized with no params" do

    it "should default to the current week" do
      the_date = Date.new(2014, 10, 6)
      allow(Date).to receive(:today).and_return(the_date)
      @week = Week.new
      expect(@week.start_date).to eql(the_date)
    end

    describe "on a day that is not monday" do
      before do
        the_date = Date.new(2014, 10, 12)
        allow(Date).to receive(:today).and_return(the_date)
      end

      it "should start on a monday" do
        @week = Week.new
        expect(@week.start_date.monday?).to be_truthy
      end

      it "should start on the closest past monday" do
        @week = Week.new
        expect(@week.start_date).to eql(Date.new(2014, 10, 6))
      end
    end
  end

  describe "when created with a non-monday date" do
    before do
      @week = Week.new(Date.new(2014, 6, 1))
    end

    it "should start on a monday" do
      expect(@week.start_date.monday?).to be_truthy
    end

    it "should start on the closest past monday" do
      expect(@week.start_date).to eql(Date.new(2014, 05, 26))
    end
  end

  describe "end date" do
    before do
      @week = Week.new(Date.new(2014, 6, 1))
    end

    it "should be on a sunday" do
      expect(@week.end_date.sunday?).to be_truthy
    end
    it " should be 6 days after the start date" do
      expect(@week.end_date).to eql(@week.start_date + 6)
    end
  end


  describe "days of the week" do
    before do
      @week = Week.new(Date.new(2014, 10, 14))
    end

    it "should include all the days of the week" do
      expect(@week).to respond_to(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end

    it "should be valid in relation to the starting date" do
      the_date = Date.new(2014, 10, 13)
      expect(@week.monday).to eql(the_date)
      expect(@week.tuesday).to eql(the_date + 1)
      expect(@week.wednesday).to eql(the_date + 2)
      expect(@week.thursday).to eql(the_date + 3)
      expect(@week.friday).to eql(the_date + 4)
      expect(@week.saturday).to eql(the_date + 5)
      expect(@week.sunday).to eql(the_date + 6)
    end

  end


end
