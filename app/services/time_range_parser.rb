TimeRangeParser = Struct.new(:from_time, :to_time, keyword_init: true) do
  def range
    start_time..end_time
  end

  def start_time
    if from_time.is_a?(Time)
      from_time
    else
      parse_time(from_time.to_s)
    end
  end

  def end_time
    if to_time.is_a?(Time)
      to_time
    else
      parse_time(to_time)
    end
  end

  def parse_time(time)
    Time.zone.parse(time.to_s)
  end
end
