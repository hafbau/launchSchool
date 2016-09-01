class BeerSong
  def verse(number)
    bottle_class = [ZeroBottle, OneBottle, TwoBottles][number] || OtherBottles
    bottle_class.new.verse(number)
  end

  def verses(start, finish)
    number_of_bottles = start.downto(finish).to_a
    number_of_bottles.map { |number| verse(number) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

class ZeroBottle
  def verse(num=nil)
    "No more bottles of beer on the wall, no more bottles of beer.\n"\
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class OneBottle
  def verse(num=nil)
    "1 bottle of beer on the wall, 1 bottle of beer.\n"\
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class TwoBottles
  def verse(num=nil)
    "2 bottles of beer on the wall, 2 bottles of beer.\n"\
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class OtherBottles
  def verse(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"\
    "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end
end