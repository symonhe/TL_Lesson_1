# Symon He
# November 6, 2014
# Lesson 1 Assignment 1: calculator2.rb
# Attempt #2 with error checking on user inputs

#Checks to see if is string is NOT A NUMBER (specifically a float).  TRUE = "not a number", FALSE = "is a number"
class String
  def nan?
    self !~ /^\s*[+-]?((\d+_?)*\d+(\.(\d+_?)*\d+)?|\.(\d+_?)*\d+)(\s*|([eE][+-]?(\d+_?)*\d+)\s*)$/
  end
end

#get valid 1st # from user
valid = false
until valid
  puts "=> Please enter a valid first number:"
  num1 = gets.chomp
  if !num1.nan?
    num1f = num1.to_f
    valid = true
  end
end

#get valid 2nd # from user
valid = false
until valid
  puts "=> Please enter a valid 2nd number:"
  num2 = gets.chomp
  if !num2.nan?
    num2f = num2.to_f
    valid = true
  end
end

#get valid operator input from user
valid = false
until valid
  puts "=> Please enter a valid operation: 1 = ADD, 2 = SUBTRACT, 3 = MULTIPLY, 4 = DIVIDE"
  op = gets.chomp.to_f
  if !op.nan? && (op == 1 || op == 2 || op ==3 || op ==4)
    valid = true
  end
end

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





