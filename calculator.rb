# Symon He
# November 6, 2014
# Lesson 1 Assignment 1: calculator.rb
# Attempt #1 without error checking on user inputs

#Checks to see if is string is NOT A NUMBER (specifically a float).  TRUE = "not a number", FALSE = "is a number"

#get 1st # from user
puts "=> Please enter a valid first number:"
num1 = gets.chomp
num1f = num1.to_f

#get 2nd # from user
puts "=> Please enter a valid 2nd number:"
num2 = gets.chomp
num2f = num2.to_f

#get valid operator input from user
puts "=> Please enter a valid operation: 1 = ADD, 2 = SUBTRACT, 3 = MULTIPLY, 4 = DIVIDE"
op = gets.chomp.to_f

#perform and output correct operation
result =
  case op
  when 1 then "#{num1f} + #{num2f} = #{num1f + num2f}"
  when 2 then "#{num1f} - #{num2f} = #{num1f - num2f}"
  when 3 then "#{num1f} * #{num2f} = #{num1f * num2f}"
  when 4 then "#{num1f} / #{num2f} = #{num1f / num2f}"
  else "You did not enter a valid operation.  No result"
  end

puts "Result is: " + result

