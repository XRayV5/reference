class EquationGuesser

  def initialize(operands, desired_result)
    @guess_results = []
    @equation_operands = operands
    @equation_result = desired_result
  end

  def result?
    equation = equationGenrator
    result = eval(equation)
    @guess_results << { equation: equation, result: result, result_diff: (@equation_result - result) }
    (@equation_result == result)
  end

  def equationGenrator
    equation = ""
    operators = ["+","-","*","/"]

    @equation_operands.each_with_index do |operand,index|
      equation << operand.to_s
      equation << operators.sample unless (@equation_operands.count-1) == index
    end
    equation
  end

  def displayResults
    #puts "All Guesses"
    #puts @guess_results
    best_guess = @guess_results.sort_by{ |hsh| hsh[:result_diff] }.first
    puts "Guesses: #{@guess_results.count} Best Guess: #{best_guess[:equation]} = #{best_guess[:result]} (#{best_guess[:result_diff]})"

    puts
  end

  def guesses(guess)
    while @guess_results.count < guess do
      break if result?
    end
    displayResults
  end

end
eg = EquationGuesser.new([1,2,3,4],24)
eg.guesses(5)
