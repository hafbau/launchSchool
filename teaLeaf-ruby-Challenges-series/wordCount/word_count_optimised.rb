class Phrase
  def initialize(text)
    @text = text
  end

  def word_count
    hash = {}
    @text.scan(/\w+'?\w+|\d+/) do |word|
    down_caps = word.downcase
      hash[down_caps] ? hash[down_caps] += 1 : hash[down_caps] = 1
    end
    hash
  end
end