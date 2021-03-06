class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
=begin
[0,1,2]
[3,4,5]
[6,7,8]
=end
  WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,4,6],
    [2,5,8],
    [3,4,5],
    [6,7,8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(str)
    str.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] == "X" ||
    @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0,8) &&
    !position_taken?(index)
  end

  def turn_count
    turns = 0
    @board.each do |token|
      if token == "X" || token == "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    cp = current_player
    if valid_move?(index)
      move(index, cp)
      display_board
    else
      turn
    end
  end

  def won?
    @winner = ""
    WIN_COMBINATIONS.detect do |combo|
      if @board[combo[0]] == "X" &&
        @board[combo[1]] == "X" &&
        @board[combo[2]] == "X"
        combo
        @winner = "X"
      elsif @board[combo[0]] == "O" &&
        @board[combo[1]] == "O" &&
        @board[combo[2]] == "O"
        combo
        @winner = "O"
      else
        false
      end
    end
  end

  def full?
    @board.all? {|mt| mt != " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    won?
    if @winner == "X"
      "X"
    elsif @winner == "O"
      "O"
    else
      nil
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
      nil
    end
  end

end
