require_relative 'account'
# SauceBank
class Bank
  attr_accessor :accounts
  def initialize
    @accounts ||= load_accounts
  end

  def load_accounts
    []
  end

  def find_account(name)
    @accounts.select do |acct|
      acct.owner.name.downcase == name.downcase
    end
  end

  def has_account?(name)
    query = find_account(name)
    !query.empty?
  end

  def create_account(name)
    new_acct = Account.new({ owner: name })
    add_account(new_acct)
    new_acct
  end

  def add_account(acct)
    puts 'account added.'
    @accounts << acct
  end

  def remove_acct(acct)
    find_account(acct.owner.name).delete
    puts 'account removed.'
  end
end
