require 'pry'

class Human
  def initialize(game, row, column)
    #since I no longer have a board or simple computer player I need to change this
    @game = game
    @row = row
    @column = column
  end

  def print_menu
    puts "Where would you like to move? Please use the menu numbers."
    puts "1. Move Up"
    puts "2. Move Left"
    puts "3. Move Right"
    puts "4. Move Down"
    puts "5. Move Up and Left"
    puts "6. Move Up and Right"
    puts "7. Move Down and Left"
    puts "8. Move Down and Right"
    case gets.chomp.to_i
    when 1
      if @row > 1
        return "u"
      else
        puts "You cannot move up, choose again."
        print_menu
      end
    when 2
      if @column > 1
        return "l"
      else
        puts "You cannot move left, choose again."
        print_menu
      end
    when 3
      if @column < 12
        return "r"
      else
        puts "You cannot move right, choose again."
        print_menu
      end
    when 4
      if @column < 7
        return "d"
      else
        puts "You cannot move down, choose again."
        print_menu
      end
    when 5
      if @row > 1 && @column > 1
        return "ul"
      else
        puts "You cannot move up and left, choose again."
        print_menu
      end
    when 6
      if @row > 1 && @column < 12
        return "ur"
      else
        puts "You cannot move up and right, choose again."
        print_menu
      end
    when 7
      if @row < 7 && @column > 1
        return "dl"
      else
        puts "You cannot move down and left, choose again."
        print_menu
      end
    when 8
      if @row < 7 && @column < 12
        return "dr"
      else
        puts "You cannot move down and right, choose again."
        print_menu
      end
    else
      puts "Invalid input. Use numbers!"
      print_menu
    end
  end

  def move
    case print_menu
    when "u"
      check_bite?(-1, 0) ? zombify(-1, 0) : move_mark(-1, 0)
    when "l"
      check_bite?(0, -1) ? zombify(0, -1) : move_mark(0, -1)
    when "r"
      check_bite?(0, 1) ? zombify(0, 1) : move_mark(0, 1)
    when "d"
      check_bite?(1, 0) ? zombify(1, 0) : move_mark(1, 0)
    when "ul"
      check_bite?(-1, -1) ? zombify(-1, -1) : move_mark(-1, -1)
    when "ur"
      check_bite?(-1, 1) ? zombify(-1, 1) : move_mark(-1, 1)
    when "dl"
      check_bite?(1, -1) ? zombify(1, -1) : move_mark(1, -1)
    else
      check_bite?(1, 1) ? zombify(1, 1) : move_mark(1, 1)
    end
  end

  def move_mark(row, column)
    @game.board[@row][@column] = " "
    @row += row
    @column += column
    @game.board[@row][@column] = "Z"
  end

  def check_bite?(row, column)
    return @game.board[@row+row][@column+column] == "H"
  end
  
  def zombify(row, column)
    @game.board[@row+row][@column+column] = "Z"
    @game.zombies += 1
    @game.humans -= 1
  end
end