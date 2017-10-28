require_relative 'user'
# SauceBank accounts
class Account
  attr_accessor :balance, :owner
  def initialize(acct_options = {})
    @owner = User.new({ name: acct_options[:owner] })
    @balance = 100
  end

  def deposit(amount)
    @balance += amount.to_i
    puts "your balance is now $#{@balance}"
  end

  def withdraw(amount)
    @balance -= amount.to_i
    puts "your balance is now $#{@balance}"
  end
end
