class Octal
  attr_reader :octal
  
  def initialize(str)
    @octal = str.split('').map { |chr| chr.to_i } unless str.match(/[8-9a-z]/)
  end

  def to_decimal
    return 0 unless octal
    dec = octal.map.with_index { |digit, idx| digit * (8 **(octal.size - 1 - idx)) }
    dec.reduce(:+)
  end
end
