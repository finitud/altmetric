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
    full_start_date = date_with_time_formatter(start_date)

    if start_time && end_time
      "#{full_start_date} at #{start_time} to #{end_time}"
    elsif start_time
      "#{full_start_date} at #{start_time}"
    elsif @end_time
      "#{full_start_date} until #{end_time}"
    else
      full_start_date
    end
  end

  def same_month_formatter(start_date, end_date, start_time, end_time)
    full_start_date = date_with_time_formatter(start_date)
    full_end_date = date_with_time_formatter(end_date)

    if start_time && end_time
      "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
    elsif start_time
      "#{full_start_date} at #{start_time} - #{full_end_date}"
    elsif end_time
      "#{full_start_date} - #{full_end_date} at #{end_time}"
    else
      @start_date.strftime("#{start_date.day.ordinalize} - #{end_date.day.ordinalize} %B %Y")
    end
  end

  def same_year_formatter(start_date, end_date, start_time, end_time)
    display_year = start_time || end_time

    full_start_date = date_with_time_formatter(start_date, start_time, with_year: display_year)
    full_end_date = date_with_time_formatter(end_date, end_time)
    "#{full_start_date} - #{full_end_date}"
  end

  def default_formatter(start_date, end_date, start_time, end_time)
    full_start_date = date_with_time_formatter(start_date, start_time)
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
    elsif @start_date.year == @end_date.year
      if @start_date.month == @end_date.month
        return same_month_formatter(@start_date, @end_date, @start_time, @end_time)
      else
        return same_year_formatter(@start_date, @end_date, @start_time, @end_time)
      end
    else
      return default_formatter(@start_date, @end_date, @start_time, @end_time)
    end
  end
end
