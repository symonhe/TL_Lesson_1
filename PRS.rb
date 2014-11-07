# Symon He
# November 7, 2014
# Tealeaf Lesson 1 Assignment 2: PRS.rb
# Attempt #1

#results map: key value 1 is user choice and key value 2 is computer choice (1 = P, 2 = R, 3 = S)
results = {
  "P" => {
    1 => "You and Computer both chose Paper. You Tie!",
    2 => "You chose Paper and Computer chose Rock.  You Win!",
    3 => "You chose Paper and Computer chose Scissors. You Lose."
    },
  "R" => {
    1 => "You chose Rock and Computer chose Paper. You Lose.",
    2 => "You and Computer both chose Rock. You Tie!",
    3 => "You chose Rock and Computer chose Scissors. You Win!"
    },
  "S" => {
    1 => "You chose Scissors and Computer chose Paper. You Win!",
    2 => "You chose Scissors and Computer chose Rock.  You Lose.",
    3 => "You and Computer both chose Scissors. You Tie!"
    }
  }

#game play logic
play = true
puts "Paper Rock Scissors. Let's Play."

while play
  puts "____________________________"
  puts "Choose P, R, or S"
  player = gets.chomp.capitalize

  computer = 1 + rand(3)

  puts results[player][computer]
  play = false

  puts "Do you want to play again? y/n?"
  again = gets.chomp.capitalize

  if again == "Y"
    play = true
  end
end
