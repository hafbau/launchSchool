module Diamond
  TOP = "A"
  def self.make_diamond(letter)
    letter = letter.upcase and index = (TOP...letter).to_a.size
    init_width_str = " " * (2 * index + 1)
    
    top_half = self.make_top_half(init_width_str, TOP, index)
    top_half + self.fold(top_half, letter)
  end

  def self.make_top_half(init_str, letter, idx)
    unless idx < 0
      row_str = init_str.dup
      row_str[idx] = letter and row_str[row_str.size - idx - 1] = letter
      row_str += "\n" + self.make_top_half(init_str, letter.succ, idx - 1)
    end
    row_str ||= ""
  end

  def self.fold(half, base)
    (half.sub(/(\n#{base}\s+#{base}\n)/, "").reverse + "\n" unless base == TOP) || ""
  end

end