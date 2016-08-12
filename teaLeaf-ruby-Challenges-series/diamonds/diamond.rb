
module Diamond
  SPACE = " "
  LETTERS = ("A".."Z").to_a.map.with_index.to_h.freeze

  def self.make_diamond(letter)
    letter = letter.upcase
    index = LETTERS[letter]
    init_width_str = SPACE * (2 * index + 1)
    string = ""

    "A".upto(letter, true) do |char|
      string += self.make_row(init_width_str, char, index) + "\n"
      index -= 1
    end

    base = self.make_row(init_width_str, letter, 0)
    string + base + string.reverse + "\n"
  end

  def self.make_row(init_str, letter, idx)
    init_str = init_str.dup
    init_str[idx] = letter and init_str[init_str.size - idx - 1] = letter
    init_str
  end

end

module Bookkeeping
  VERSION = 1
end
