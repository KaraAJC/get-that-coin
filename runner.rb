require_relative 'account'
require_relative 'user'

def make_account(name)
  Account.new({ owner: name })
end

def welcome
  puts "Hello! What's your name?"
  name = gets.chomp
  session_customer = make_account(name)
  puts "hello #{session_customer.owner.name}"
end

welcome
