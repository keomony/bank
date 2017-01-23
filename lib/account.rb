#Manages bank account
class Account
  attr_reader :name, :balance, :bank_statement

  def initialize(name)
    @name = name
    @balance = 0
    @bank_statement = []
  end

  def deposit(amount, date)
    @balance += amount
    bank_statement.unshift(["#{date}", "%.2f" % amount, "", "%.2f" % balance])
  end

  def withdraw(amount, date)
    @balance -= amount
  end

end
