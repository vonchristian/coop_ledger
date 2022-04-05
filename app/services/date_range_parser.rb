DateRangeParser = Struct.new(:from_date, :to_date, keyword_init: true) do

  def range
    start_date..end_date
  end

  def start_date
    return from_date if from_date.is_a?(Date) || from_date.is_a?(DateTime)

    DateTime.parse(from_date.to_s)
  end

  def end_date
    return to_date if to_date.is_a?(Date) || to_date.is_a?(DateTime)

    DateTime.parse(to_date.to_s)
  end
end
