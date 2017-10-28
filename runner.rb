require_relative 'account'
require_relative 'user'
require 'pry'

def make_account(name)
  Account.new({ owner: name })
end

def goodbye
  puts 'Goodbye, thanks for banking with SauceBank! Stay Saucey.'
end

def get_choice(session_customer)
  puts "#{session_customer.owner.name}, would you like to see your balance, make a withdrawal or make a deposit?"
  choice = gets.chomp
  case choice
  when 'balance'
    puts session_customer.balance
    goodbye
  when 'withdraw'
    # puts session_customer.withdraw()
    # goodbye
  when 'deposit'
    # puts session_customer
    # goodbye
  end
end

def welcome
  puts "Hello! What's your name?"
  name = gets.chomp
  session_customer = make_account(name)
  get_choice(session_customer)

end

welcome
