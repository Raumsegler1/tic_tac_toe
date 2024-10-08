class TicTacToeLogic
  attr_accessor :player_symbol1, :player_symbol2

  def initialize(player1, player2)
    @player_symbol1 = player1
    @player_symbol2 = player2
    @game_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def play(player, choice)
    game_array[choice - 1] = player
  end

  def input(player)
    puts "#{player} select your position:"
    choice_new = gets.chomp.to_i
    if choice_new.positive? && choice_new < 10 && !played?(choice_new)
      choice_new
    else
      puts 'invalid input, pls try again'
      input(player)
    end
  end

  def played?(choice)
    game_array[choice - 1] == player_symbol1 || game_array[choice - 1] == player_symbol2
  end

  def display
    puts "#{game_array[0]} | #{game_array[1]} | #{game_array[2]}"
    puts '--+---+--'
    puts "#{game_array[3]} | #{game_array[4]} | #{game_array[5]}"
    puts '--+---+--'
    puts "#{game_array[6]} | #{game_array[7]} | #{game_array[8]}"
  end

  def row?(choice, index1, index2, index3, player)
    if player == 1
      (choice[index1 - 1] == player_symbol1) && (choice[index2 - 1] == player_symbol1) && (choice[index3 - 1] == player_symbol1)
    elsif player == 2
      (choice[index1 - 1] == player_symbol1) && (choice[index2 - 1] == player_symbol1) && (choice[index3 - 1] == player_symbol1)
    end
  end

  def over?(num)
    if row?(game_array, 1, 2, 3, num) ||
       row?(game_array, 4, 5, 6, num) ||
       row?(game_array, 7, 8, 9, num) ||
       row?(game_array, 1, 4, 7, num) ||
       row?(game_array, 2, 5, 8, num) ||
       row?(game_array, 3, 6, 9, num) ||
       row?(game_array, 1, 5, 9, num) ||
       row?(game_array, 7, 5, 3, num)

      return true
    end

    false
  end

  private

  attr_accessor :game_array
end
