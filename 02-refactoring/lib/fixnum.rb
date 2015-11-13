class Fixnum
  def ordinalize
    if (11..13).include?(abs % 100)
      "#{self}th"
    else
      case abs % 10
      when 1; "#{self}st"
      when 2; "#{self}nd"
      when 3; "#{self}rd"
      else    "#{self}th"
      end
    end
  end
end

