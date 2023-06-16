# require 'pry'
require_relative 'detail.rb'
class Account < Details
  # include User

  def self.action
    Details.details
    Details.show
    # puts "want to enter more details : [yes/no]"
    # response = gets.chomp.to_s
    # if response == yes
    #   Details.details
    # end

    # @@user_details.each do |x|
    #   puts "Enter your account_number for more operations :"
    #   acc_num = gets.chomp.to_i
      
    def self.transfer
      @@user_details.each do |x|
      puts "Enter your account_number for more operations :"
      acc_num = gets.chomp.to_i
        if x[:account_number] == acc_num
          puts "X ==> #{x}"
          puts 'choose action : s for show balance\n t for transfer\n'
          user_operation = gets.chomp.downcase

          case user_operation
          when 's'
            puts "Balance:====>>>> #{x[:balance]}"
          when 't'
            puts 'reciever account_number'
            rec_acc = gets.chomp.to_i
            puts 'enter amount'
            money = gets.chomp.to_i
            if x[:balance] > money
              x[:balance] -= money
            elsif puts "not enough money your current balance is : #{x[:balance]}"
            else
            end
            @@user_details.each do |i|
              if i[:account_number] == rec_acc
                i[:balance] += money
              end
            end
          end
        end
      end
    end
  end
end
