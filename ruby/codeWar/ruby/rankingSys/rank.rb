
class User

  attr_reader :rank, :progress

  def initialize
    @rank = -8
    @progress = 0
  end

  def inc_progress act
    p act
    raise ArgumentError if act.abs > 8 || act == 0
    act -= 1 if act > 0 && @rank < 0
    act += 1 if act < 0 && @rank > 0
    oldrank = @rank

    if @rank - act < 0
      if (@progress += ((@rank - act).abs ** 2 *10)) >= 100
        @rank += (@progress/100)
        @progress = @progress%100
      end
    elsif @rank - act == 0
      if (@progress += 3) >= 100
        @rank += (@progress/100)
        @progress = @progress%100
      end
    elsif @rank - act == 1
      if (@progress += 1) >= 100
        @rank += (@progress/100)
        @progress = @progress%100
      end
    end
    @rank += 1 if oldrank < 0 and @rank >= 0
    @progress = 0 if @rank == 8
  end

end


user = User.new
p user.rank # => -8
p user.progress # => 0
p user.inc_progress(-7)
p user.progress # => 10
p user.inc_progress(-5) # will add 90 progress
p user.progress # => 0 # progress is now zero
p user.rank # => -7 # rank was upgraded to -7
