class Details

  @@user_details = []

  def self.details

    puts "Please fill the details :"

    info = {}
    print "Enter your name :"
    info[:name] = gets.chomp.to_s

    print "Enter your contact :"
    info[:number] = gets.chomp.to_i

    print "Enter your address :"
    info[:address] = gets.chomp

    print "Enter your account number :"
    info[:account_number] = gets.chomp.to_i

    print "Enter your balance :"
    info[:balance] = gets.chomp.to_i

    puts "Enter pin"
    info[:pin] = gets.chomp.to_i

    @@user_details << info

    # return @@user_details
  end

  def self.show
    puts @@user_details
  end

end

Details.details
# Details.show
