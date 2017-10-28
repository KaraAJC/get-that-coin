# SauceBank users
class User
  attr_accessor :name
  def initialize(user_options = {})
    @name = user_options[:name]
  end
end
