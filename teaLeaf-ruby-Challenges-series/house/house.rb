class House

  def self.recite
    House.new.poem.sub(/^\n/, '')
  end

  def poem
    previous_lines = pieces.last[0] + '.'

    pieces.reverse_each.reduce("") do |stanzas, piece|
      previous_lines = [piece.join("\n"), previous_lines].join(' ') if piece[1]
      stanzas += "\nThis is " + previous_lines + "\n"
    end
    
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end