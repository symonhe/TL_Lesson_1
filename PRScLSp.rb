# Symon He
# November 7, 2014
# Tealeaf Lesson 1 Assignment 2: PRScLSp.rb
# Attempt #2: I just had to make this version for fun. =)

#results map: key value 1 is user choice and key value 2 is computer choice (1 = P, 2 = R, 3 = Sc, 4=L, 5 = Sp)
results = {
  "P" => {
    1 => "You and Computer both chose Paper. You Tie!",
    2 => "You chose Paper and Computer chose Rock. Paper covers Rock -- You Win!",
    3 => "You chose Paper and Computer chose Scissors. Scissors cut Paper -- You Lose.",
    4 => "You chose Paper and Computer chose Lizard. Lizard eats Paper -- You Lose.",
    5 => "You chose Paper and Computer chose Spock. Paper disproves Spock -- You Win!"
    },
  "R" => {
    1 => "You chose Rock and Computer chose Paper. Paper covers Rock -- You Lose.",
    2 => "You and Computer both chose Rock. You Tie!",
    3 => "You chose Rock and Computer chose Scissors. Rock crushes Scissors -- You Win!",
    4 => "You chose Rock and Computer chose Lizard. Rock crushes Scissors -- You Win!",
    5 => "You chose Rock and Computer chose Spock.  Spock vaporizes Rock -- You Lose."
    },
  "SC" => {
    1 => "You chose Scissors and Computer chose Paper. Scissors cut Paper -- You Win!",
    2 => "You chose Scissors and Computer chose Rock. Rock crushes Scissors -- You Lose.",
    3 => "You and Computer both chose Scissors. You Tie!",
    4 => "You chose Scissors and Computer chose Lizard. Scissors decapitate Lizard -- You Win!",
    5 => "You chose Scissors and Computer chose Spock. Spock smashes Scissors -- You Lose."
    },
  "L" => {
    1 => "You chose Lizard and Computer chose Paper. Lizard eats Paper -- You Win!",
    2 => "You chose Lizard and Computer chose Rock. Rock crushes Lizard -- You Lose.",
    3 => "You chose Lizard and Computer chose Scissors. Scissors decapitate Lizard -- You Lose.",
    4 => "You and Computer both chose Lizard. You Tie!",
    5 => "You chose Lizard and Computer chose Spock.  Lizard poisons Spock -- You Win!"
    },
  "SP" => {
    1 => "You chose Spock and Computer chose Paper.  Paper disproves Spock -- You Lose",
    2 => "You chose Spock and Computer chose Rock. Spock vaporizes Rock -- You Win!",
    3 => "You chose Spock and Computer chose Scissors. Spock smashes Scissors -- You Win!",
    4 => "You chose Spock and Computer chose Lizard.  Lizard poisons Spock -- You Lose.",
    5 => "You and Computer both chose Spock. You Tie!"
    }
  }

#game play logic
play = true
puts "Paper Rock Scissors Lizard Spock. Let's Play!"

while play
  puts "____________________________"
  puts "Choose P, R, Sc, L, or Sp"
  player = gets.chomp.upcase

  computer = 1 + rand(5)

  puts results[player][computer]
  play = false

  puts "Do you want to play again? y/n?"
  again = gets.chomp.capitalize

  if again == "Y"
    play = true
  end
end
