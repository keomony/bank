class Account
  attr_reader :name, :balance, :bank_statement

  def initialize(name)
    @name = name
    @balance = 0
    @bank_statement = []
  end

  def deposit(amount)
    @balance += amount
  end
end
