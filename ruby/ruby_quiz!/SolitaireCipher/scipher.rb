
require 'pry'

def groupMsg str

  str.gsub!(/[^a-z]/i, '')

  puts str.upcase!

  arr_str = str.split('').each_slice(5).to_a

  p arr_str.last.length

  if arr_str.last.length < 5
    while arr_str.last.length < 5
      arr_str.last << 'X'
    end
  end
  p arr_str
end



groupMsg "Code in Ruby, live longerrrr!"
