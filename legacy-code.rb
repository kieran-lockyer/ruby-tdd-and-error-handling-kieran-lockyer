def validate_number #Will loop until a valid integer is entered, and return it as a float
    begin
        puts "Enter an integer"
        Integer(gets.chomp).to_f
    rescue ArgumentError
        puts "You must enter an integer!"
        retry
    end
end

puts "welcome to the banking app"
#password function
puts "what is you password?"
input = gets.chomp
password= "password"
application_runtime=true

count=0
until input == password or count== 2
    puts "input invalid, try again"
    count +=1
    input = gets.chomp
end
if input != password 
    puts "restart app-incorrect password"
    return 
end
system "clear"

#main menu 
begin
    balance = File.read("balance.txt").to_f
rescue Errno::ENOENT
    puts "No balance.txt file in directory. Create a balance.txt file and restart the app!"
    return
end   


while application_runtime

    puts "Welcome what would you like to do? (options:Deposit; Withdraw; Balance; Quit)"
    b = ["random","balance","deposit","quit","withdraw"]
    options = gets.chomp
    until options == b[1] or b[2] or b[3]
        puts "input invalid"
        options = gets.chomp
    end

    # balance function
    if options == b[1]
        puts "Your balance is #{balance}"
    elsif options == b[2]
        # desposit function
        puts "your balance is #{balance}"
        puts "how much would you like to deposit"
        input_deposit = validate_number
        while input_deposit <= -1
            puts "no deposit made"
            input_deposit = validate_number
        end
        balance = balance + input_deposit
        puts "your balance is #{balance}"   
    elsif options == b[3]
        #quit functions
        File.write("balance.txt", balance)
        application_runtime=false
        puts "good bye"
    elsif options == b[4]
        #withdraw function
        puts "your balance is #{balance}"
        puts "how much would you like to withdraw"
        input_withdrawal = validate_number 
        while input_withdrawal >= balance 
            puts "insufficient balance for withdrawal"
            input_withdrawal = validate_number 
        end
        balance = balance - input_withdrawal
        puts "your balance is #{balance}"

    File.write("balance.txt", balance)
    end
end