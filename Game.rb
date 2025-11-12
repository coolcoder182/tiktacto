class Game
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @currPlayer = p1
    @moves = Array.new(3) {Array.new(3) {0}}
  end

  def play
    #main game loop
    game_over = false
    loop do
      print_screen
      puts "#{currPlayer}'s turn, select square"
      input = gets.chomp
      swap_player
      break if game_over
    end
  end

  def swap_player
    if (currPlayer == p1)
      @currPlayer = p2
      return
    end
    @currPlayer = p1
  end

  def print_screen
    
  end

  # getters setters
  def currPlayer
    @currPlayer
  end
  def currPlayer=(new_player)
    @currPlayer = new_player
  end
  def p1
    @p1
  end
  def p2
    @p2
  end
  def p1=(new_p1)
    @p1 = new_p1
  end
  def p2=(new_p2)
    @p2 = new_p2
  end
  def moves
    @moves
  end
  def moves=(new_moves)
    @moves = new_moves
  end
end