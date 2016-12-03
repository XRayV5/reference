def format_duration(seconds)
  #your code here
  p seconds
  return 'now' if seconds == 0
  converted = cal_duration(seconds)
  formator(converted)
end

def cal_duration(seconds)
  bases = [365 * 24 * 60**2, 24 * 60**2, 60**2 , 60, 1]
  bases.map do |base|
    result = seconds.divmod(base)
    seconds = result[1]
    base = result[0]
  end
end

def formator duration_arr
p duration_arr
  units = [' year', ' day', ' hour', ' minute', ' second']
  formated_arr = duration_arr.map.with_index do |val, i|
    if val == 1
      val = val.to_s << units[i] << ','
    elsif val > 1
      val = val.to_s << units[i] << 's,'
    else
     val = ''
    end

  end
  formated_arr.select!{|unit| !unit.empty?}
  if formated_arr.length > 1
    return formated_arr[0...-1].join(' ').chop << ' and ' << formated_arr[-1].chop
  else
    return formated_arr.join.chop
  end
end
