require './bank_account'

describe BankAccount do

	#The it method takes two arguments, a string (description of 
	#the test), and a code block
	it "is created with an opening balance and the name of the client" do
		#Inside the "it" code block we write the "code we wish we had"
		account = BankAccount.new(500, "Sarah")
		#and then, set an expectation as to the result of running
		#our code. Notice the expect method, along with the account
		#object as an argument, and the .to method with the be_a matcher
		expect(account).to be_a(BankAccount)
	end
	#You will see a status bar for the tests at the top of the 
	#Rspec test that looks like this: ******
	#As the tests pass, the *'s turn to a green dot, and 
	#the number of pending tests in the list decreases by one.
	#If the test fails, the status bar will report a red "F" instead. 
	
	#The test below uses a different matcher. Instead of be_a,
	#it is eq, and represents the same as the equality operator.
	it "can report it's balance" do
		account = BankAccount.new(500, "Sarah")
		expect(account.balance).to eq(500)
	end
	
	#1) Create an account 
	#2) make a deposit to that account(.deposit) 
	#3) Set the expectation that the balance changed 
	# to reflect your deposit. .balance == balance + deposit
	it "can make deposits" do
		account = BankAccount.new(500, "Sarah")
		account.deposit(100)
		expect(account.balance).to eq(600)
	end
	
	#1) Create two bank accounts 
	#2) Call a transfer method on one BankAccount, 
	#passing it two arguments: an amount and the 
	# other BankAccount. (With these two arguments, 
	# it will know how much to move and which BankAccount 
	# to move it to. 
	# 3) Finally, we'd set expectations that both BankAccount 
	#balances reflect the transfer.

	it "can make withdrawals" do
		account = BankAccount.new(500, "Sarah")
		account.withdraw(100)
		expect(account.balance).to eq(400)
	end

	it "can transfer funds to another bank account" do
		account = BankAccount.new(500, "Sarah")
		account2 = BankAccount.new(500, "Steve")
		account.transfer(100, account2)
		expect(account.balance).to eq(400)
		expect(account2.balance).to eq(600)
	end


	it "throws an error if minimum opening balance of 200 is not met" do
  	#The error syntax is different. It takes in an arguement,
  	#(in this case an object) as its argument. Notice the matcher
  	#raise_error with the Ruby standard ArgumentError as its argument.
  	expect { BankAccount.new(100, "Sarah") }.to raise_error(ArgumentError)
	end

	#1) Call a class method minimum_balance= to make the minimum 
	#balance higher. 
	#2) Try to create a BankAccount with more than 200 but still 
	#under our new minimum balance, and expect that to raise an 
	#error. 
	#3) And just to be sure, try to create a BankAccount with out 
	#new minimum balance and expect that to_not raise an error.
	it "allows the user to change the minimum balance" do
		BankAccount.set_min_balance = 300
		expect(BankAccount.get_min_balance).to eq(300)
		expect { BankAccount.new(250, "Sarah") }.to raise_error(ArgumentError)
		expect { BankAccount.new(350, "Sarah") }.not_to raise_error(ArgumentError)
	end

end