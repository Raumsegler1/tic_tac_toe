require_relative 'lib/tic_tac_toe_logic'

def play_round(player1, player2, game, i)
  game.display
  current_play = game.input('player1')
  game.play(player1, current_play)
  if game.over?(1)
    game.display
    puts 'player1 has won'
    return false
  end
  i[0] += 1
  return false if i[0] == 9

  game.display
  current_play = game.input('player2')
  game.play(player2, current_play)
  if game.over?(2)
    game.display
    puts 'player2 has won'
    return false
  end
  i[0] += 1
  return false if i[0] == 9

  true
end

def play_game
  i = [0, 'lol']

  puts 'which symbol should represent player1'
  player1 = gets.chomp

  puts 'which symbol should represent player2'
  player2 = gets.chomp

  game = TicTacToeLogic.new(player1, player2)

  break unless play_round(player1, player2, game, i) until i[0] == 9
  puts 'Its a tie' if i[0] == 9
end

play_game
