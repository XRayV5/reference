require 'pry'

def assginSanta

  namelist = [
    {firstname: "Luke", lastname: "Skywalker", email:   "<luke@theforce.net>", chosen: false},
    {firstname: "Leia", lastname: "Skywalker", email:   "<leia@therebellion.org>", chosen: false},
    {firstname: "Toula", lastname: "Portokalos", email:   "<toula@manhunter.org>", chosen: false},
    {firstname: "Gus", lastname: "Portokalos", email:   "<gus@weareallfruit.net>", chosen: false},
    {firstname: "Virgil", lastname: "Brigman", email:   "<virgil@rigworkersunion.org>", chosen: false},
    {firstname: "Lindsey", lastname: "Brigman", email:   "<lindsey@iseealiens.net>", chosen: false}
  ]

  result = []

  namelist.each do |towhom|
    namelist.each do |one|
      if one[:lastname] != towhom[:lastname] && !one[:chosen]
        result << {to: towhom, from: one}
        one[:chosen] = true
        break
      end
    end
  end

  puts result
end

assginSanta
