require "date_range_formatter"

RSpec.describe(DateRangeFormatter) do
  it "formats a date range for the same day" do
    formatter = DateRangeFormatter.new("2009-11-1", "2009-11-1")
    expect(formatter.to_s).to eq("1st November 2009")
  end

  it "formats a date range for the same day with starting time" do
    formatter = DateRangeFormatter.new("2009-11-1", "2009-11-1", "10:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00")
  end

  it "formats a date range for the same day with starting and ending times" do
    formatter = DateRangeFormatter.new("2009-11-1", "2009-11-1", "10:00", "11:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 to 11:00")
  end

  it "formats a date range for the same month" do
    formatter = DateRangeFormatter.new("2009-11-1", "2009-11-3")
    expect(formatter.to_s).to eq("1st - 3rd November 2009")
  end

  it "formats a date range for the same month with starting time" do
    formatter = DateRangeFormatter.new("2009-11-1", "2009-11-3", "10:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 3rd November 2009")
  end

  it "formats a date range for the same month with starting and ending times" do
    formatter = DateRangeFormatter.new("2009-11-1", "2009-11-3", "10:00", "11:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 3rd November 2009 at 11:00")
  end

  it "formats a date range for the same year" do
    formatter = DateRangeFormatter.new("2009-11-1", "2009-12-1")
    expect(formatter.to_s).to eq("1st November - 1st December 2009")
  end

  it "formats a date range for the same year with starting time" do
    formatter = DateRangeFormatter.new("2009-11-1", "2009-12-1", "10:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 1st December 2009")
  end

  it "formats a date range for the same year with starting and ending times" do
    formatter = DateRangeFormatter.new("2009-11-1", "2009-12-1", "10:00", "11:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 1st December 2009 at 11:00")
  end

  it "formats a date range for different year" do
    formatter = DateRangeFormatter.new("2009-11-1", "2010-12-1")
    expect(formatter.to_s).to eq("1st November 2009 - 1st December 2010")
  end

  it "formats a date range for different year with starting time" do
    formatter = DateRangeFormatter.new("2009-11-1", "2010-12-1", "10:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 1st December 2010")
  end

  it "formats a date range for different year with starting and ending times" do
    formatter = DateRangeFormatter.new("2009-11-1", "2010-12-1", "10:00", "11:00")
    expect(formatter.to_s).to eq("1st November 2009 at 10:00 - 1st December 2010 at 11:00")
  end
end

