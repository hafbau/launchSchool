module RunLengthEncoding

  def self.encode(input)
    count = 0
    output = ""
    prev_char = ""
    input.each_char do |char|
      if (char == prev_char) || (prev_char == "")
        count += 1
      else
        output << ((count if count > 1).to_s + prev_char)
        count = 1
      end
      
      prev_char = char
    end
    output << ((count if count > 1).to_s + prev_char)
  end

  def self.decode(input)
    output = ""
    number_str = ""
    input.each_char do |char|
      number_str << char if char.to_i > 0
      if char.to_i == 0
        number_str = '1' if number_str == ""
        output << (char * number_str.to_i)
        number_str = ""
      end
    end
    output
  end

end