# Mental model:

# Represent the valid grids as constants, then have a constant hash "OCR_HASH" of the constant strings

# Conversion:
# - checks the input binary font for right size
# - Convert one binary font uses OCR_HASH to return the right number and a default "?"

class OCR

  # private

  ZERO = <<-NUMBER.chomp
 _
| |
|_|

    NUMBER
  ONE = <<-NUMBER.chomp

  |
  |

    NUMBER
  TWO = <<-NUMBER.chomp
 _
 _|
|_

    NUMBER
  THREE = <<-NUMBER.chomp
 _
 _|
 _|

    NUMBER
  FOUR = <<-NUMBER.chomp

|_|
  |

    NUMBER
  FIVE = <<-NUMBER.chomp
 _
|_
 _|

    NUMBER
  SIX = <<-NUMBER.chomp
 _
|_
|_|

    NUMBER
  SEVEN = <<-NUMBER.chomp
 _
  |
  |

    NUMBER
  EIGHT = <<-NUMBER.chomp
 _
|_|
|_|

    NUMBER
  NINE = <<-NUMBER.chomp
 _
|_|
 _|

    NUMBER

  OCR_HASH = { ONE => "1", TWO => "2", THREE => "3", FOUR => "4",
               FIVE => "5", SIX => "6", SEVEN => "7", EIGHT => "8", NINE => "9", ZERO => "0"
              }

  def initialize(text)
    @text = text
  end

  def convert
    split_paragraph(@text).map do |line|
      split_line(line).map { |font| OCR_HASH.fetch(font, "?") }.join
    end.join(",")
  end

  private

  def split_paragraph(para)
    para.split("\n\n")
  end

  def split_line(line)
    fonts = line.split("\n").each_with_object([]) do |row, numbers|
      digit = 0
      row.chars.each_slice(3) do |sliced|
        numbers[digit] = numbers[digit].to_s + sliced.join
        digit += 1
      end
      numbers.map! { |num| num << "\n" }
    end

    fonts[0].prepend("\n") if line[0] == "\n"
    trim(fonts)
  end

  def trim(str_arry)
    str_arry.map { |str| str.gsub(/\s+\n/, "\n")  }
  end
end