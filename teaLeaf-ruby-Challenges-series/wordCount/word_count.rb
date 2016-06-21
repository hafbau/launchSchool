class Phrase
  def initialize(text)
    @text = text.scan(/\w+'?\w+|\d+/)
  end

  def word_count
    @text.each_with_object({0}) do |word, hash|
      hash[word.downcase] += 1
   end
  end
end