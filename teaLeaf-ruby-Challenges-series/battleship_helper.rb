class BattleShipPlayer

  def initialize(name)
    @name = name
    init_ships
    init_board
  end
end

module Shipable

  def init_ships
    @fleet = { :Destroyer => [], :Cruiser => [], :Battleship => [] }
    possible_spaces = (1..limit).to_a

    @fleet.each do |type, _|
      loop do
        @orientation = ['horizantal', 'vertical'].sample
        head = possible_spaces.delete(possible_spaces.sample)
        break if type == :Destroyer
        body = @orientation == 'horizantal' ? head + 1 : head + @board_width
        break if possible_spaces.include? body and type == :Cruiser
        tail = @orientation == 'horizantal' ? body + 1 : body + @board_width
        break if [body, tail].all? { |pos| possible_spaces.include? pos }
      end

      @fleet[type] << head
      @fleet[type] << body unless type == :Destroyer
      @fleet[type] << tail if type == :Battleship        
    end
  end

  end