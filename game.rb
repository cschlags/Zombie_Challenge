#since this class will be the one being run by human require_relative board and player 
require 'active_support/all'
require_relative "./computer"
require_relative "./human"
require 'pry'

class Game
  attr_accessor :board, :boards, :humans, :zombies, :countdown

  def initialize
    create_game
  end

  def create_game
    design_board
    randomize_players
    game_play
  end

  def design_board
    @board = []
    i = 0
    while i < 9
      if i < 1
        @board << []
        14.times {@board[i] << "#"}
        i+=1
      elsif i < 8
        @board << []
        @board[i] << "#"
        12.times {@board[i] << " "}
        @board[i] << "#"
        i+=1
      else
        @board << []
        14.times {@board[i] << "#"}
        i+=1
      end
    end
  end

  def randomize_players
    @humans = 0
    @zombies = 0
    until @humans == 10
      y = rand(1..7)
      x = rand(1..12)
      @board[y][x] = "H"
      @humans += 1
    end
    until @zombies == 1
      y = rand(1..7)
      x = rand(1..12)
      if @board[y][x] != "H"
        @board[y][x] = "Z"
        @human = Human.new(self, y, x)
        puts "You are playing as a zombie. BITE SOMEONE!"
        @zombies += 1
      end
    end
  end

  def game_play
    print_board
    case @humans
    when @humans < 1
      binding.pry
      puts "The world has turned into zombies! Congratulations on your voracious brain appetite."
      play_again
    else
      human_moves
      game_play
    end
  end

  def print_board
    @boards = @board.in_groups_of(@board.length)
    printed_board = "\n\n"
    @boards.each_with_index do |row, i|
      row.each do |string|
        #designing the actual board
        string.each do |char|
          printed_board += "#{char}"
        end
        printed_board += "\n"
      end
      printed_board += "\n\n"
    end
    puts printed_board
  end

  def human_moves
    @human.move
  end

  def play_again
    puts "Play again? y/n"
    response = gets.chomp
    response == "y" ? Game.new : exit
  end
end
#create the new game
game = Game.new