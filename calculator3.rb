# Symon He
# November 6, 2014
# Lesson 1 Assignment 1: calculator3.rb
# Attempt #3 with better error checking

#Method to check if number is float
def is_num_float(num_string)
    !(num_string !~ /^\s*[+-]?((\d+_?)*\d+(\.(\d+_?)*\d+)?|\.(\d+_?)*\d+)(\s*|([eE][+-]?(\d+_?)*\d+)\s*)$/)
end

#check if input is 1-4
def valid_operation(num)
  num == 1 || num == 2 || num ==3 || num ==4
end

#get valid 1st # from user
begin
  puts "=> Please enter a valid first number:"
  num1 = gets.chomp
end until is_num_float(num1)

#get valid 2nd # from user
begin
  puts "=> Please enter a valid 2nd number:"
  num2 = gets.chomp
end until is_num_float(num2)

#get valid operator input from user
begin
  puts "=> Please enter a valid operation: 1 = ADD, 2 = SUBTRACT, 3 = MULTIPLY, 4 = DIVIDE"
  op = gets.chomp
end until is_num_float(op) && valid_operation(op.to_f)

#perform and output correct operation
num1f = num1.to_f
num2f = num2.to_f

result =
  case op.to_f
  when 1 then "#{num1f} + #{num2f} = #{num1f + num2f}"
  when 2 then "#{num1f} - #{num2f} = #{num1f - num2f}"
  when 3 then "#{num1f} * #{num2f} = #{num1f * num2f}"
  when 4 then "#{num1f} / #{num2f} = #{num1f / num2f}"
  else "You did not enter a valid operation.  No result"
  end

puts "Result is: " + result





