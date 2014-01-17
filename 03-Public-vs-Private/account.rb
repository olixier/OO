require_relative 'transaction'

class DepositError < StandardError
end

class WithdrawError < StandardError
end

class BankAccount
  
  attr_reader :name, :position, :transactions

  MIN_DEPOSIT =  100
  
  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban
    
    add_transaction(initial_deposit)
  end
    
  def withdraw(amount)
    raise WithdrawError, "Insufficient funds" unless amount >= @position
    add_transaction(-amount)
    puts "You've just withdrawn #{amount} euros"
  end
  
  def deposit(amount)
    raise DepositError, "Invalid Amount" unless amount > 0
    add_transaction(amount)
    puts "You've just made a #{amount} euro deposit"
  end
  
  def transactions_history(args = {})
    if args == {}
      puts "no password given"
    else
      if args[:password] == @password
        puts @transactions
      else
        puts "wrong password"
      end
    end
    return nil
  end
  
  def iban
    @iban[0, 4] + "**************" + @iban[-3, 3]
  end
  
  def to_s
    "Owner: #{@name}\nIBAN: #{iban}\nCurrent amount: #{@position} euros"
  end
          
  private  
  
  def add_transaction(amount)
    # Main account logic
    @transactions << Transaction.new(amount)
    @position += amount
  end
    
end

# TESTING YOUR BANK ACCOUNT

# In the outside world, create a new account for Bruce Lee
account = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit")

# Accessible infos
puts account.name # => Bruce Lee
puts account.iban # => FR14**************606
puts account.position # => 200

# Nicely print account's infos (over-riding #to_s)
puts account  # =>  Owner: Bruce Lee
              #     IBAN: FR14**************606
              #     Current amount: 200 euros

# Make some transactions
account.withdraw(515) # => You've just withdrawn 515 euros
account.deposit(100) # => You've just made a 100 euros deposit
account.deposit(650) # => You've just made a 650 euros deposit

# Print transactions history with password
account.transactions_history(password: "brucelit") # => [200, -515, 100, 650]
account.transactions_history(password: "brucewayne") # => wrong password
account.transactions_history() # => no password given


# Check current position
puts account.position == 435 # => true

# Un-comment the following to test custom exception
too_small_deposit = BankAccount.new("Poor Billy", "FR14-2004-1010-0505-0001-3M02-606", 50, "toopoor")
