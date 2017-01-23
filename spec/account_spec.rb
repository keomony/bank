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

      it "should be able to deposit" do
        mony.deposit(1000)
        expect(mony.balance).to eq(1000)
      end

    end
  end

end
