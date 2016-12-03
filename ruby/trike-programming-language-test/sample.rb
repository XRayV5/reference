class StringDemystifier

  def initialize(str)
    @my_str = str
  end

  def demystify

    process_pattern1
    process_pattern2
    process_pattern3
    puts @my_str
    @my_str
  end

  def process_pattern1
    ("A".."Z").to_a.each do |c|
      regexp = Regexp.new "#{c}[[:alpha:]]#{c}"
      @my_str.gsub!(regexp,c*3)
    end
  end

  def process_pattern2
    ("A".."Z").to_a.each do |c|
      regexp = Regexp.new c*6
      @my_str.gsub!(regexp,c)
    end
  end


  def process_pattern3
    new_str = ""
    while @my_str.include?("!")
      index = @my_str.rindex("!")
      str = @my_str.slice(index .. -1)
      new_str <<  str.reverse.chop
      @my_str.gsub!(str,"")
    end
    @my_str = new_str
  end

end
str_demystifier = StringDemystifier.new("!YTIRCO!IQIIQIDEMGMMIM FO YMJMMSM!RA !EGEEJEHT ROEOOSOF PAEJEEBEL TN!AIKIITIG ENVNNMNO ,GQGGCGN!ILEKIZIISIRT A RJRRDROF PETOTTJTS LLZLLEL!AMSXSSMS ENODOOSO")

str_demystifier.demystify
