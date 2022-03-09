class Roadtrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :temp,
              :condition

  def initialize(origin,destination,route,weather)
    @start_city = origin
    @end_city = destination
    @travel_time = route[:route][:formattedTime]
    @temp = temp(route,weather)
    @condition = condition(route,weather)
  end

  def temp(route,weather)
    round = 0
    time = route[:route][:formattedTime]

    hours = time.slice(0..1).to_i
    minutes = time.slice(3..4).to_i
    if minutes < 30
      round
    elsif minutes >= 30
      round = 1
    end
    total_hours = hours + round
    temp = nil
    if round < 48
      temp = weather[:hourly][total_hours][:temp]
    elsif round >= 48
      temp = weather[:daily][2][:temp][:day]
    end
    temp
  end

  def condition(route,weather)
    round = 0
    time = route[:route][:formattedTime]
    hours = time.slice(0..1).to_i
    minutes = time.slice(3..4).to_i
    if minutes < 30
      round
    elsif minutes >= 30
      round = 1
    end
    total_hours = hours + round
    conditions = nil
    if round < 48
      conditions = weather[:hourly][total_hours][:weather][0][:description]
    elsif round > 48
      conditions = weather[:daily][total_hours][:weather][0][:description]
    end
    conditions
  end

end
