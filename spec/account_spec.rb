require "./lib/account"

describe Account do
  subject(:mony_acc) { described_class.new("Mony") }

  context "as a new account" do

    it {is_expected.to respond_to :name}

    it "should have a balance 0" do
      expect(mony_acc.balance).to eq(0)
    end

    it "should have an empty bank statement" do
      expect(mony_acc.bank_statement).to eq([])
    end

  end

  context "as an existing account" do
    describe "#deposit" do
      before do
        mony_acc.deposit(1000,"10/01/2012")
      end


      it "should be able to deposit" do
        expect(mony_acc.balance).to eq(1000)
      end

      it "should add to the bank statement record" do
        expect(mony_acc.bank_statement).to include([" 10/01/2012 ", " 1000.00    ", "            ", " 1000.00    "])
      end

      it "should increase the bank statement record by 1" do
        expect{mony_acc.deposit(1000, "11/01/2012")}.to change{mony_acc.bank_statement.count}.by(1)
      end

    end

    describe "#withdraw" do
      before do
        mony_acc.deposit(1000,"10/01/2012")
        mony_acc.deposit(2000,"13/01/2012")
      end

      it "should be able to withdraw" do
        mony_acc.withdraw(500, "14/01/2012")
        expect(mony_acc.balance).to eq(2500)
      end

      it "should add to the bank statement record" do
        mony_acc.withdraw(500, "14/01/2012")
        expect(mony_acc.bank_statement).to include([" 14/01/2012 ", "            ", " 500.00     ", " 2500.00    "])
      end

      it "should increase the bank statement record by 1" do
        expect{mony_acc.deposit(1000, "11/01/2012")}.to change{mony_acc.bank_statement.count}.by(1)
      end

    end

    describe "#print_bank_statement" do
      before do
        mony_acc.deposit(1000,"10/01/2012")
        mony_acc.deposit(2000,"13/01/2012")
        mony_acc.withdraw(500, "14/01/2012")
      end

      it "should print the bank statement" do
        expect(mony_acc).to respond_to(:print_bank_statement)
      end
    end

  end

end
