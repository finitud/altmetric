require "date"
require "fixnum"

class DateRangeFormatter
  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @start_time = start_time
    @end_time = end_time
  end

  def same_date_formatter(full_start_date, full_end_date)
    if @start_time && @end_time
      "#{full_start_date} at #{@start_time} to #{@end_time}"
    elsif @start_time
      "#{full_start_date} at #{@start_time}"
    elsif @end_time
      "#{full_start_date} until #{@end_time}"
    else
      full_start_date
    end
  end

  def same_month_formatter(full_start_date, full_end_date)
    if @start_time && @end_time
      "#{full_start_date} at #{@start_time} - #{full_end_date} at #{@end_time}"
    elsif @start_time
      "#{full_start_date} at #{@start_time} - #{full_end_date}"
    elsif @end_time
      "#{full_start_date} - #{full_end_date} at #{@end_time}"
    else
      @start_date.strftime("#{@start_date.day.ordinalize} - #{@end_date.day.ordinalize} %B %Y")
    end
  end

  def same_year_formatter(full_start_date, full_end_date)
    if @start_time && @end_time
      "#{full_start_date} at #{@start_time} - #{full_end_date} at #{@end_time}"
    elsif @start_time
      "#{full_start_date} at #{@start_time} - #{full_end_date}"
    elsif @end_time
      "#{full_start_date} - #{full_end_date} at #{@end_time}"
    else
      @start_date.strftime("#{@start_date.day.ordinalize} %B - ") +
      @end_date.strftime("#{@end_date.day.ordinalize} %B %Y")
    end
  end

  def default_formatter(full_start_date, full_end_date)
    if @start_time && @end_time
      "#{full_start_date} at #{@start_time} - #{full_end_date} at #{@end_time}"
    elsif @start_time
      "#{full_start_date} at #{@start_time} - #{full_end_date}"
    elsif @end_time
      "#{full_start_date} - #{full_end_date} at #{@end_time}"
    else
      "#{full_start_date} - #{full_end_date}"
    end
  end

  def to_s
    full_start_date = @start_date.strftime("#{@start_date.day.ordinalize} %B %Y")
    full_end_date = @end_date.strftime("#{@end_date.day.ordinalize} %B %Y")

    if @start_date == @end_date
      return same_date_formatter(full_start_date, full_end_date)
    elsif @start_date.month == @end_date.month
      return same_month_formatter(full_start_date, full_end_date)
    elsif @start_date.year == @end_date.year
      return same_year_formatter(full_start_date, full_end_date)
    else
      return default_formatter(full_start_date, full_end_date)
    end
  end
end

