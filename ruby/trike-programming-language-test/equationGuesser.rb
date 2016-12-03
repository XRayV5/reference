require 'pry'

# binding.pry

class EquationGuesser


  def initialize arr, result
    @operands = arr
    @result = result
    @operators = ["+","-","*","/"]
  end

  def guess guesses
    eq_arr = []
    counter = 0
    best = 0
    bestguess = []
    bestIndex = 0
    while counter < guesses
      eq_arr << make_eq(@operands, @operators, @result)
      if counter == 0
        best = eq_arr.last[-2].abs
      end
      if eq_arr.last[-2].abs <= best
        best = eq_arr.last[-2].abs
        bestguess = eq_arr.last
        bestIndex = counter + 1
        if eq_arr.last[-2] == 0
          break
        end
      end
      counter += 1
    end
    printResult eq_arr, bestguess, bestIndex
  end

  def make_eq ints, cals, result
    eq = []
    ints.shuffle.each_with_index do |val, i|
      if i == 0
        eq << val
      else
        eq << cals.sample
        eq << val
      end
    end
    eq = calResult eq, result
    eq
  end

  def calResult equation, result
    eq = equation.map{|x| x}
    eq.each_with_index do |val, i|
      if val == "-"
          eq[i] = 0
          eq[i+1] = 0 - eq[i+1]
      elsif val == "+"
          eq[i] = 0
      elsif val == "*"
          eq[i+1] = eq[i-1] * eq[i+1]
          eq[i] = 0
          eq[i-1] = 0
      elsif val == "/"
        eq[i+1] = (eq[i-1] / eq[i+1])
        eq[i] = 0
        eq[i-1] = 0
      end
    end
    actual = eq.reduce(:+)
    equation << "="
    equation << actual
    equation << "("
    equation << 0 - (result - actual).to_i.abs
    equation << ")"
  end

  def printResult eqs, bestgus, bestIdx
    eqs.each do |arr|
      p arr.join(" ")
    end
    p "Guesses: #{bestIdx}, BestGuess #{bestgus.join(' ')}"
  end

end

equation_guesser = EquationGuesser.new([1, 2, 3, 4], 24)
equation_guesser.guess(3)

# equation_guesser = EquationGuesser.new([1, 2, 3, 4,5,6,7,8,9,10], 900)
# equation_guesser.guess(1000)
