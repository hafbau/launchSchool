class Anagram

  def initialize(word)
    @word = word
    @wary = word.downcase.chars.sort
  end

  def match(list)
    anagrams = list.group_by { |word| word.downcase.chars.sort }[@wary] || []
    anagrams.reject { |anagram| anagram.casecmp(@word) == 0}
  end

end