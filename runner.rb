require_relative 'bank'

# SauceBank runner class
class Runner
  attr_accessor :customer
  def initialize
    @bank = Bank.new
    welcome
  end

  def confirm_customer(name)
    if @bank.has_account?(name)
      @customer = find_account(name).first
    else
      puts "looks like you don't have an account, No Worries, I'll make one!"
      @customer = @bank.create_account(name)
    end
  end

  def print_menu
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

  def make_choice(choice)
    if choice == 'balance'
      puts customer.balance
    elsif %w[withdraw deposit].include?(choice)
      puts 'how much?'
      amount = gets.chomp
      customer.send(choice, amount)
    else
      puts "sorry, that's not an option..."
    end
    print_menu
  end

  # loop method to let user get bal, +, -
  def run_bank
    # print_menu
    # while gets.chomp != 'goodbye'
    #   make_choice(gets.chomp.downcase)
    # end
    # goodbye
  end

  def welcome
    puts "Hello! What's your name?"
    name = gets.chomp
    @customer = confirm_customer(name)
    run_bank
  end
end

Runner.new
# run.welcome
