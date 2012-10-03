module ApplicationHelper

  def get_base_time
    now = Time.now
    return Time.new(now.year, now.month, now.day, now.hour+1, 0).strftime("%Y-%m-%d %l:%M %p")
  end

  def get_base_date
    return Date.today.strftime("%Y-%m-%d %l:%M %p")
  end

end