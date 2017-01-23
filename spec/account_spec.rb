require "./lib/account"

describe Account do
  subject(:mony) { described_class.new("Mony") }

  context "as a new account" do

    it {is_expected.to respond_to :name}
    it "should have a balance 0" do
      expect(mony.balance).to eq(0)
    end
  end

end
