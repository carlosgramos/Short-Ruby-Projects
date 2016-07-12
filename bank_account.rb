=begin
We need to be able to create new bank accounts with opening balances and the name of the client.
We should be able to check an account's balance at any time.
We need to be able to make deposits and withdrawals to those accounts.
We should be able to transfer funds between accounts.
We want to have a minimum opening balance. We should be able to change that amount at any time.
=end

#Rspec is run from the oop_bank/ directory, not from the Rspec
#directory
class BankAccount

  #Instance attributes getter_setter methods
  attr_reader :balance

  #***************************
  #class @@min_balance attribute
  @@min_balance = 200

  #class attribute setter_method
  #the SELF keyword is mandatory
  def self.set_min_balance=(amount)
    @@min_balance = amount
  end

  #class attribute reader method
  #the SELF keyword is mandatory
  def self.get_min_balance
    @@min_balance
  end
  #***************************

  #Instance method definition
  def initialize(balance, name)
    if balance >= @@min_balance
      @balance = balance
      @name = name
    else
      raise ArgumentError, "Minimum deposit is $200"
    end
  end

  def deposit(amount)
   @balance += amount
  end

  def withdraw(amount)
   @balance -= amount
  end

  def transfer(amount, account)
    withdraw(amount)
    account.deposit(amount)
  end

  #Rescue Block
  begin
  rescue
  end

end
