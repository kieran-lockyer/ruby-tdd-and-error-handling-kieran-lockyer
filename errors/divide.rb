# This is a simple divider.
# Imagine the user tries to divide by zero
# Ruby will rightfully freak out and crash with a ZeroDivisionError
# Let's bring in some error handling to display a nice message.
#

class String
    def is_i?
       /\A[-+]?\d+\z/ === self
    end
end

class NonNumericArgumentError < StandardError
end

def divide (dividend,divisor)
    quotient = dividend/divisor
end

def validate_number(number)
    raise NonNumericArgumentError if !number.is_i?
    return number
end

puts "--------------------"
puts "--- Division App ---"
puts "--------------------"

begin
    attempts ||= 3
    puts "Give me a number"
    number1 = validate_number(gets.chomp).to_i
    puts "Give me another number"
    number2 = validate_number(gets.chomp).to_i
    answer = divide(number1,number2)
    print "#{number1} divided by #{number2} = "
    print "#{answer || "error"}"
    puts
rescue ZeroDivisionError
    puts "You cannot divide by 0. Please retry with digits greater than 0." 
    attempts -= 1
    retry if attempts > 0
rescue NonNumericArgumentError
    puts "An error occurred. Did you enter integers?"
    attempts -= 1
    retry if attempts > 0
end

#
# Code along challenge: if they hit an error, take them back to "give me a number"