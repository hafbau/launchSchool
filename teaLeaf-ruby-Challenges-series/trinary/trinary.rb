class Trinary

  def initialize(trinary_str)
    @trinary_revers = trinary_str.match(/^[0-2]+$/).to_s.chars.reverse
  end

  def to_decimal
    @trinary_revers.map.with_index { |char, i| char.to_i * 3 ** i }.reduce(:+).to_i
  end
end