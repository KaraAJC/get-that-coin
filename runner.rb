require_relative 'account'
require_relative 'user'

# SauceBank runner class
class Runner
  def initialize
    @customer = ''
  end

  def print_menu(customer)
    puts <<-EOT
      #{customer.owner.name},
      would you like to:
      - see your balance, (balance)
      - make a withdrawal, (withdraw) or
      - make a deposit? (deposit)
    EOT
  end

  def goodbye
    puts 'Goodbye, thanks for banking with SauceBank! Stay Saucey.'
  end

  def get_choice(customer)
    choice = gets.chomp.downcase
    if choice == 'balance'
      puts customer.balance
    elsif %w[withdraw deposit].include?(choice)
      puts 'how much?'
      amount = gets.chomp
      customer.send(choice, amount)
    end
    goodbye
  end

  def welcome
    puts "Hello! What's your name?"
    name = gets.chomp
    customer = find_customer
    print_menu(customer)
    get_choice(customer)
  end
end

run = Runner.new
run.welcome
