require "date"
require "fixnum"

class DateRangeFormatter
  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @start_time = start_time
    @end_time = end_time
  end

  def same_date_formatter(start_date, end_date, start_time, end_time)
    base_date = date_with_time_formatter(start_date, start_time)
    if end_time
      suffix = start_time ? " to #{end_time}" : " until #{end_time}"
    end
    "#{base_date}#{suffix}"
  end

  def default_formatter(start_date, end_date, start_time, end_time)
    with_year = true
    with_month = true

    if start_date.year == end_date.year
      with_year = start_time || end_time
      with_month = start_time || end_time if start_date.month == end_date.month
    end

    full_start_date = date_with_time_formatter(start_date,
                                               start_time,
                                               with_year: with_year,
                                               with_month: with_month)
    full_end_date = date_with_time_formatter(end_date, end_time)
    "#{full_start_date} - #{full_end_date}"
  end

  def date_with_time_formatter(date, time=nil, join_word='at', with_year: true, with_month: true)
    month = ' %B' if with_month
    year = ' %Y' if with_year
    time = " #{join_word} #{time}" if time
    date.strftime("#{date.day.ordinalize}#{month}#{year}#{time}")
  end

  def to_s
    if @start_date == @end_date
      return same_date_formatter(@start_date, @end_date, @start_time, @end_time)
    else
      return default_formatter(@start_date, @end_date, @start_time, @end_time)
    end
  end
end
