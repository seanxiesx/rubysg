module ApplicationHelper
  def format_when(from, to)
    if from.to_date == to.to_date
      date        = from.strftime("%b %-e, %Y")
      from_time   = from.strftime("%-l:%M%P")
      to_time     = to.strftime("%-l:%M%P")
      "#{date} - #{from_time} to #{to_time}"
    else
      from_string = from.strftime("%b %-e, %-l:%M%P")
      to_string   = to.strftime("%b %-e, %-l:%M%P")
      "#{from_string} to #{to_string}"
    end
  end
end
