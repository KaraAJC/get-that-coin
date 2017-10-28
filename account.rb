# SauceBank accounts
class Account
  attr_accessor :balance, :owner
  def initialize(acct_options = {})
    owner = User.new(acct_options[:owner])
    balance = 100
  end
end
