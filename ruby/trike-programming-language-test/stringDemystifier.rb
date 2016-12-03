require 'pry'

class StringDemystifier

  def initialize str
    @toDemystify = str
  end

  def demystify
    p @toDemystify
    # task1
    @toDemystify = palindromeReplace @toDemystify
    p @toDemystify
    # task2
    @toDemystify = charSix @toDemystify
    p @toDemystify
    # task3
    @toDemystify = exclaimRev @toDemystify
    p @toDemystify
  end

  def palindromeReplace str
    cursor = 1
    while cursor <= str.length-2
      if str[cursor-1] == str[cursor+1] && str[cursor-1] != ' '
        str[cursor] = str[cursor-1] = str[cursor+1]
      end
      cursor+=1
    end
    str
  end

  def charSix str
    cursor = 0
    str = str.split('')
    while cursor+5 <= str.length
      streak = 1
      for i in 1...6
        if str[cursor] == str[cursor+i]
          streak += 1
        end
        if streak == 6
          for j in 1...6
            str[cursor+j] = ''
          end
          cursor += 5
        end
      end
      cursor +=1
    end
    str.join
  end

  def exclaimRev str
    if str.include?('!')
      str.reverse!
      str.gsub!(/!/, '')
    end
    str
  end

end

theStr = "!YTIRCO!IQIIQIDEMGMMIM FO YMJMMSM!RA !EGEEJEHT ROEOOSOF PAEJEEBEL TN!AIKIITIG ENVNNMNO ,GQGGCGN!ILEKIZIISIRT A RJRRDROF PETOTTJTS LLZLLEL!AMSXSSMS ENODOOSO"

testStr = StringDemystifier.new(theStr)

testStr.demystify
