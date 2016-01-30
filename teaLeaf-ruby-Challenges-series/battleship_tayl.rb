class BattleShip
  attr_accessor :boards, :robot, :human

  def initialize
    say_welcome
    @robot = Robot.new
    @human = Human.new(player_name)
  end

  def play
    loop do 
      show_boards
      break if game_over?
      human.shoot
      robot.shoot unless game_over?
    end

    say_winner
    reset if play_again?
  end
  
  def say_welcome
    %W(Welcome to the Battleship!!!).each { |char| print char and sleep 0.05 and puts}
  end

  def player_name
    puts 'Your name please =>'
    gets.chomp
  end

  def game_over?
    !!winner
  end

  def say_winner
    puts "#{winner} wins!"
  end

  def winner
    human.name if robot.fleet_sunk?
    robot.name if human.fleet_sunk?
  end

  def play_again?
    begin
      puts 'Would you like to play again? (y/n) =>'
      answer = gets.chomp.downcase
    end while answer.any?('y','n')

    answer == 'y'
  end
 
end