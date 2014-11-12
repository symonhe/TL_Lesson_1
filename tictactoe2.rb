# Symon He
# November 11, 2014
# Tealeaf Lesson 1 Assignment 3: tictactoe2.rb
# Attempt #2

def num_is_float?(num_string)
  !(num_string !~ /^\s*[+-]?((\d+_?)*\d+(\.(\d+_?)*\d+)?|\.(\d+_?)*\d+)(\s*|([eE][+-]?(\d+_?)*\d+)\s*)$/)
end

def assign_board_value(board, value)
  for i in 1..9
    if value
      board[i] = value
    else
      board[i] = i
    end
  end
end

def available_move?(board, move)
  available = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  board.each {|k,v| available.delete(k) if (v == "X" || v == "O")}
  available.include?(move)
end

def add_to_board(board, player, nextmove, symbol)
  board[nextmove] = symbol
  player.push(nextmove)
end

def smart_comp_next_move(user, comp, winning_lines)
  available = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  corners = [1,3,7,9]
  choice = 0

  user.each {|x| available.delete(x)}
  comp.each {|y| available.delete(y)}

  defense_moves = user.sort.combination(2).to_a.product(winning_lines).collect {|x,y| (y-x) if (y-x).count ==1}.compact.flatten
  attack_moves = comp.sort.combination(2).to_a.product(winning_lines).collect {|x,y| (y-x) if (y-x).count ==1}.compact.flatten

  if !(attack_moves & available).empty?
    choice = (attack_moves & available).sample
  elsif !(defense_moves & available).empty?
    choice = (defense_moves & available).sample
  elsif available.include?(5)
    choice = 5
  elsif ((corners & available).count == 2) & (comp.count == 1) & ((comp & corners).count == 0)
    choice = (corners & available).sample[0] + 1 if (corners & available).sample[0] < 8
  elsif !(corners & available).empty?
    (corners & available).each do |x|
      if (user.include?(x - 1) || user.include?(x +1))
        choice = x
      else
        choice = (corners & available).sample
      end
    end
  else
    choice = available.sample
  end

  return choice
end

def win_line?(board, win_lines)
  if win_lines.find {|l| l.all? {|k| board[k] == "X"} }
    puts "You Win!"
    true
  elsif win_lines.find {|l| l.all? {|k| board[k] == "O"} }
    puts "Sorry, you lose."
    true
  end
end

def print_board(b)
  system("clear")
  puts "     |     |     "
  puts "  #{b[1]}  |  #{b[2]}  |  #{b[3]}"
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{b[4]}  |  #{b[5]}  |  #{b[6]}"
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{b[7]}  |  #{b[8]}  |  #{b[9]}"
  puts "     |     |     "
end

loop do
  winning_lines = [[1,2,3], [4,5,6], [7,8,9],[1,4,7], [2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  comp_moves = []
  user_moves = []
  board = {}

  assign_board_value(board, false)
  print_board(board)
  assign_board_value(board, "-")

  begin
    if (board.values.select {|v| v == "-"}.count == 1)
      user_next_move = board.select{|k, v| k if v == '-'}.keys.first
      add_to_board(board, user_moves, user_next_move.to_i, "X")
    else
      begin
        puts "Enter your move from what is available: #{(board.keys - user_moves - comp_moves).join(", ")}"
        user_next_move = gets.chomp
      end until available_move?(board, user_next_move.to_i) && num_is_float?(user_next_move)

      add_to_board(board, user_moves, user_next_move.to_i, "X")
      print_board(board)

      comp_next_move = smart_comp_next_move(user_moves, comp_moves, winning_lines)
      add_to_board(board, comp_moves,comp_next_move, "O")
    end

    sleep 0.25
    print_board(board)

    if (board.values.select {|v| v == "-"}.count < 1)
      puts "You Tie!"
      gameover = true
    else
      gameover = win_line?(board, winning_lines)
    end

  end until gameover

  puts "Do you want to play again? y/n."
  break if gets.chomp.downcase != 'y'

end
