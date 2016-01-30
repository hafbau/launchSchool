class PigLatin
  VOWELS, VOWEL_CONS = ['a', 'e', 'i', 'o', 'u'], {'x' => 'e', 'y' => 'i'}
  SUFFIX = 'ay'

  def self.translate(words)
    pig_latin = []
    words.split.each do |word|
      sound = get_sound word
      pig_latin << ((VOWELS.include?sound[0]) ? word : (word.sub sound, '') + sound) + SUFFIX
    end
    pig_latin.join ' '
  end

  def self.get_sound(word)
    sound = []
    word.split('').each do |char|
      sound << char
      break if VOWELS.include? char
    end
    sound.pop if sound.count > 1 and sound[sound.size - 2] != 'q'
    
    if VOWEL_CONS.keys.include?sound[0]
      sound = [VOWEL_CONS[sound[0]]] if sound.count > 1 and !VOWELS.include?sound[1]
    end
    sound.join
  end
end