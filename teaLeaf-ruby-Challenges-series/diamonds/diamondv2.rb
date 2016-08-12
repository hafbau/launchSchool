
module Diamond
  SPACE = " "
  LETTERS = ("A".."Z").to_a.map.with_index.to_h.freeze

  def self.make_diamond(letter)
    letter = letter.upcase
    padding = LETTERS[letter]

    string = ""
    cum_idx = 0
    ("A"...letter).each do |char|
      string += self.add_margin(char, cum_idx, padding)
      padding -= 1
      cum_idx = self.next_pad_count(cum_idx)
    end

    diamond = self.add_padding(letter, cum_idx)
    string + diamond + string.reverse + "\n"
  end

  def self.add_margin(char, cum_idx, padding)
    SPACE * padding + self.add_padding(char, cum_idx) + SPACE * padding + "\n"
  end

  def self.add_padding(letter, idx)
    (letter + SPACE * idx + letter unless idx == 0) or letter
  end

  def self.next_pad_count(curr_count)
    curr_count > 0 ? curr_count + 2 : curr_count + 1
  end

end

module Bookkeeping
  VERSION = 1
end