class PigLatin

  def self.translate(words)
    translated_word = ''
    words.split(' ').each do |word|
      if word[0] =~ /[aeiouAEIOU]/ || word[0..1] =~ /(yt|xr)/
        translated_word << word + 'ay '

      elsif word[0..2] !~ /[aeiouAEIOU]+/ || ( word[0..1] !~ /[aeiouAEIOU]+/ && word[2] =~ /u/ )
        translated_word << word[3..-1] + word[0..2] + 'ay '

      elsif word[0] =~ /r/
        translated_word << word[1..-1] + word[0] + 'ay '

      elsif word[0..1] !~ /[aeiouAEIOU]+/ || (word[0] !~ /[aeiouAEIOU]/ && word[1] =~ /u/ )
        translated_word << word[2..-1] + word[0..1] + 'ay '

      else
        translated_word << word[1..-1] + word[0] + 'ay '
      end
    end
    translated_word.rstrip
  end
end