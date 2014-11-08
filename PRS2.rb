# Symon He
# November 7, 2014
# Tealeaf Lesson 1 Assignment 2: PRS.rb
# Attempt #2: separate logic & data

CHOICES = {'p' => "Paper", 'r' => "Rock", 's' => "Scissors"}

def assign_choice(num)
  case num
  when 1 then "p"
  when 2 then "r"
  when 3 then "s"
  end
end

def say_choices(p, c)
  "***You chose #{CHOICES[p]} and Computer choise #{CHOICES[c]}.***"
end

puts "Let's play Paper Rock Scissors!"
loop do

  begin
    puts "Type P, R, or S.  Pick one."
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  computer_choice = assign_choice(1+rand(3))

  puts say_choices(player_choice, computer_choice)

  case
  when player_choice == computer_choice then puts "You tie!"
  when (player_choice == "p" && computer_choice == "r") then puts "----Paper covers Rock. You win!----"
  when (player_choice == "p" && computer_choice == "s") then puts "----Scissors cut Paper. You lose.----"
  when (player_choice == "r" && computer_choice == "p") then puts "----Paper covers Rock. You lose.----"
  when (player_choice == "r" && computer_choice == "s") then puts "----Rock crushes Scissors. You win!----"
  when (player_choice == "s" && computer_choice == "r") then puts "----Rock crushes Scissors. You lose.----"
  when (player_choice == "s" && computer_choice == "p") then puts "----Sciessors cut Paper. You win!----"
  end

  puts "Do you want to play again? y/n."
  break if gets.chomp.downcase != 'y'

end

puts "Thanks for playing!"

