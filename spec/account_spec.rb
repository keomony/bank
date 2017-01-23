require "./lib/account"

describe Account do
  subject(:mony) { described_class.new("Mony") }

  context "as a new account" do

    it {is_expected.to respond_to :name}
  end

end
