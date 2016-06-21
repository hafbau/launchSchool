
def translate(text)
  # text.gsub(/[^aeiou\s]/) { |match| match + "o" + match }

  consonant = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"].freeze
  idx = 0
  while(idx < text.length)

    if consonant.include? (text[idx].downcase)
      text[idx] = text[idx] + "o" + text[idx]
      idx += 3 and next
    end
    idx += 1
  end
  text
end

p translate("This is fun")