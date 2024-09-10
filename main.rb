require_relative 'lib/tic_tac_toe_logic'

def play_game
  current_play = ''
  ongoing = true

  puts 'which symbol should represent player1'
  player1 = gets.chomp

  puts 'which symbol should represent player2'
  player2 = gets.chomp

  game = TicTacToeLogic.new(player1, player2)

  def play_round(var, player1, player2, game)
    game.display
    current_play = game.input('player2')
    while game.played?(current_play)
      puts 'invalid input, try again'
      current_play = game.input('player2')
    end
    game.play(player2, current_play)
    if game.over?(current_play, 2)
      game.display
      puts 'player2 has won'
      var = false
    end

    game.display
    current_play = game.input('player1')
    while game.played?(current_play)
      puts 'invalid input, try again'
      current_play = game.input('player1')
    end
    game.play(player1, current_play)
    if game.over?(current_play, 1)
      game.display
      puts 'player1 has won'
      var = false
    end
  end

  while ongoing
    game.display
    current_play = game.input('player1')
    while game.played?(current_play)
      puts 'invalid input, try again'
      current_play = game.input('player1')
    end
    game.play(player1, current_play)
    if game.over?(current_play, 1)
      game.display
      puts 'player1 has won'
      ongoing = false
    end

    4.times do
      play_round(ongoing, player1, player2, game)
    end
    puts 'Its a tie'
    ongoing = false
  end
end

play_game
