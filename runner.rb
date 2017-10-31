require_relative 'bank'

# SauceBank runner class
class Runner
  attr_accessor :customer
  def initialize
    @bank = Bank.new
    @bank.create_account('latoya')
    @magic_word = ''
    welcome
  end

  def welcome
    puts "Hello! What's your name?"
    name = gets.chomp
    @customer = confirm_customer(name)
    run_bank
  end

  def confirm_customer(name)
    if @bank.has_account?(name)
      @customer = find_account(name).first
    else
      puts "looks like you don't have an account, No Worries, I'll make one!"
      @customer = @bank.create_account(name)
    end
  end

  def run_bank
    while @magic_word != 'goodbye'
      print_menu
      request = gets.chomp.downcase
      make_choice(request)
    end
    goodbye
  end

  def print_menu
    puts <<-EOT
      #{customer.owner.name},
      would you like to:
      - see your balance, (balance)
      - make a withdrawal, (withdraw)
      - make a deposit, (deposit) or
      - end your session (exit)
    EOT
  end

  def make_choice(choice)
    if choice == 'balance'
      puts customer.balance
    elsif ['withdraw', 'deposit'].include?(choice)
      puts 'how much?'
      customer.send(choice, gets.chomp)
      puts "your balance is now $#{customer.balance}"
    elsif choice == 'exit'
      @magic_word = 'goodbye'
    else
      puts "sorry, that's not an option..."
    end
  end

  def goodbye
    puts 'Goodbye, thanks for banking with SauceBank! Stay Saucey.'
  end
end

Runner.new
