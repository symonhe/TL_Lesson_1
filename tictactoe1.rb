# Symon He
# November 9, 2014
# Tealeaf Lesson 1 Assignment 3: tictactoe1.rb
# Attempt #1 before solutions review

$winning_lines = [[1,2,3], [4,5,6], [7,8,9],[1,4,7], [2,5,8],[3,6,9],[1,5,9],[3,5,7]]

def num_is_float?(num_string)
    !(num_string !~ /^\s*[+-]?((\d+_?)*\d+(\.(\d+_?)*\d+)?|\.(\d+_?)*\d+)(\s*|([eE][+-]?(\d+_?)*\d+)\s*)$/)
end

def smart_comp_next_move(user, comp, available)
  corners = [1,3,7,9]

  user_combos = user.sort.combination(2).to_a
  comp_combos = comp.sort.combination(2).to_a

  choice = 0

  defense_moves = user_combos.product($winning_lines).collect {|x,y| (y-x) if (y-x).count ==1}
  attack_moves = comp_combos.product($winning_lines).collect {|x,y| (y-x) if (y-x).count ==1}

  defense_moves = defense_moves.compact.flatten
  attack_moves = attack_moves.compact.flatten

  if !(attack_moves & available).empty?
    choice = (attack_moves & available).sample
  elsif !(defense_moves & available).empty?
    choice = (defense_moves & available).sample
  elsif available.include?(5)
    choice = 5
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

def win_lose_tie?(user, comp, available)
  status = false

  user_combos = user.combination(3).to_a
  comp_combos = comp.combination(3).to_a

  user_combos.each do |x|
    if $winning_lines.include?(x)
      puts "You Win!"
      status = true
    end
  end

  comp_combos.each do |y|
    if $winning_lines.include?(y)
      puts "You Lose."
      status = true
    end
  end

  if available.any? == false
    puts "You Tie."
    status = true
  end

  return status
end

def print_emptyline
  puts "     |     |     "
end

def print_horizontal_line
  puts "-----+-----+-----"
end

def print_gameline(user, comp, base)
  first = " "
  second = " "
  third = " "

  user.each do |user_choice|
    case user_choice
    when base[0] then first = "X"
    when base[1] then second = "X"
    when base[2] then third = "X"
    end
  end

  comp.each do |comp_choice|
    case comp_choice
    when base[0] then first = "O"
    when base[1] then second = "O"
    when base[2] then third = "O"
    end
  end

  puts "  #{first}  |  #{second}  |  #{third}  "
end

def print_board(user, comp)
  system("clear")
  print_emptyline()
  print_gameline(user, comp, [1,2,3])
  print_emptyline()
  print_horizontal_line()
  print_emptyline()
  print_gameline(user, comp, [4,5,6])
  print_emptyline()
  print_horizontal_line()
  print_emptyline()
  print_gameline(user, comp, [7,8,9])
  print_emptyline()
  puts
end

#start game here
loop do
  user_moves = []
  comp_moves = []

  available_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  print_board(user_moves, comp_moves)

  begin
    #automate last move
    if available_moves.count == 1
      user_moves.push(available_moves.delete(available_moves.sample)).sort!
    else
      begin
        gameover = false
        puts "Enter your move from what is available: #{available_moves.join(", ")}"
        user_next_move = gets.chomp
      end until available_moves.include?(user_next_move.to_i) && num_is_float?(user_next_move)

      user_moves.push(available_moves.delete(user_next_move.to_i)).sort!

      comp_next_move = smart_comp_next_move(user_moves, comp_moves, available_moves)

      comp_moves.push(available_moves.delete(comp_next_move))
      comp_moves.sort!
    end

    print_board(user_moves, comp_moves)

    gameover = win_lose_tie?(user_moves, comp_moves, available_moves)
  end until gameover == true

  puts "Do you want to play again? y/n."
  break if gets.chomp.downcase != 'y'

end
