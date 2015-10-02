require 'cryptsy/api2'

describe Cryptsy::API2::Client do
  subject { Cryptsy::API2::Client.new }
  describe "attributes" do
    it { is_expected.to respond_to(:user) }
    it { is_expected.to respond_to(:markets) }
    it { is_expected.to respond_to(:currencies) }
    it { is_expected.to respond_to(:order) }
    it { is_expected.to respond_to(:converter) }
    it { is_expected.to respond_to(:trigger) }
  end
end
