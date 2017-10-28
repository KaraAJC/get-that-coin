# SauceBank accounts
class Account
  attr_accessor :balance, :owner
  def initialize(acct_options = {})
    @owner = User.new({ name: acct_options[:owner] })
    @balance = 100
  end

  def deposit(amount)
    @balance += amount
    # goodbye method
  end

  def withdraw(amount)
    @balance -= amount
    # goodbye method
  end
end
