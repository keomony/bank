#Manages bank account
class Account
  attr_reader :balance, :bank_statement

  def initialize(name)
    @name = name
    @balance = 0
    @bank_statement = []
  end

  def deposit(amount, date)
    @balance += amount
    add_to_bank_statement(date,amount,0,@balance)
  end

  def withdraw(amount, date)
    @balance -= amount
    add_to_bank_statement(date,0,amount,@balance)
  end

  def print_bank_statement
    print_header_of_bank_statement
    print_content_of_bank_statement
  end

  private

  def add_to_bank_statement(date,credit,debit,balance)
    if credit == 0
      @bank_statement.unshift([" #{date}", "  ", " #{'%.2f' % debit}", " #{'%.2f' % @balance}"])
    else
      @bank_statement.unshift([" #{date}", " #{'%.2f' % credit}", "  ", " #{'%.2f' % @balance}"])
    end
  end

  def print_header_of_bank_statement
    line_width = 12
    puts " date".ljust(line_width)+ "|| credit".ljust(line_width+2)+ "|| debit".ljust(line_width+2)+ "|| balance"
  end

  def print_content_of_bank_statement
    line_width = 12
    @bank_statement.each{|statement| puts (statement.map{|column| column.ljust(line_width)}).join("||")}
  end


end
