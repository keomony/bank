require "./lib/account"

describe Account do
  subject(:mony) { described_class.new("Mony") }

  context "as a new account" do

    it {is_expected.to respond_to :name}

    it "should have a balance 0" do
      expect(mony.balance).to eq(0)
    end

    it "should have an empty bank statement" do
      expect(mony.bank_statement).to eq([])
    end

  end

  context "as an existing account" do
    describe "#deposit" do
      before do
        mony.deposit(1000,"10/01/2012")
      end

      it "should be able to deposit" do
        expect(mony.balance).to eq(1000)
      end

      it "should add to the bank statement record" do
        expect(mony.bank_statement).to include(["10/01/2012", "1000.00", "", "1000.00"])
      end

    end

    describe "#withdraw" do
      before do
        mony.deposit(1000,"10/01/2012")
        mony.deposit(2000,"13/01/2012")
      end

      it "should be able to withdraw" do
        mony.withdraw(500, "14/01/2012")
        expect(mony.balance).to eq(2500)
      end
    end
  end

end
