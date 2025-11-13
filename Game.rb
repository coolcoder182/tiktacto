class Game
  attr_accessor :currSymbol, :moves
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Diagonal from top-left
    [2, 4, 6]  # Diagonal from top-right
  ]

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @currPlayer = p1
    @moves = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @currSymbol = 'x'
  end

  def play
    #main game loop
    until game_over? do
      print_screen
      puts "#{currPlayer}'s turn, select square"
      input = gets.chomp
      until isValid?(input) do
        input = gets.chomp
      end
      input = input.to_i
      updateBoard(input)
      break if game_over?
      swap_player
    end
    if @winner
      print_screen
      puts "Congrats #{@winner}, you win"
    end
    puts "Game over"
  end

  def game_over?
    if @moves.all? { |cell| cell == 'x' || cell == 'o' }
      true
    elsif hasWinningCombo?
      @winner = @currPlayer
    end
  end

  def hasWinningCombo?
    WIN_COMBINATIONS.any? do |combo|
    line = combo.map { |index| @moves[index] }
    line.uniq.length == 1 && line.first != nil && line.first != ' '
    end
  end

  def updateBoard(input)
    new_board = @moves
    new_board[input] = @currSymbol
    @moves = new_board
  end

  def isValid?(input)
    if !("0".."8").include?(input)
      puts "not valid please select 0-8"
      return false
    end
    if (self.moves[input.to_i] == 'x' || self.moves[input.to_i] == 'o')
      puts "box already taken try again"
      return false
    end
    true
  end

  def swap_player
    if (currPlayer == p1)
      @currPlayer = p2
      @currSymbol = 'o'
      return
    end
    @currSymbol = 'x'
    @currPlayer = p1
  end

  def print_screen
    puts "#{self.moves[0]} | #{self.moves[1]} | #{self.moves[2]}"
    puts "---------"
    puts "#{self.moves[3]} | #{self.moves[4]} | #{self.moves[5]}"
    puts "---------"
    puts "#{self.moves[6]} | #{self.moves[7]} | #{self.moves[8]}"
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
end