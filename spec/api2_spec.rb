require 'cryptsy/api2'

describe Cryptsy::API2::Client do
  subject { Cryptsy::API2::Client.new }

  describe 'attributes' do
    it { is_expected.to respond_to(:user) }
    it { is_expected.to respond_to(:markets) }
    it { is_expected.to respond_to(:currencies) }
    it { is_expected.to respond_to(:order) }
    it { is_expected.to respond_to(:converter) }
    it { is_expected.to respond_to(:trigger) }
  end
end

describe Cryptsy::API2::Currencies do
  subject { Cryptsy::API2::Currencies.new }

  describe '#list' do
    it 'returns non-empty JSON result' do
      expect(subject.list.count).not_to eq 0
    end
  end

  describe '#info' do
    context 'with currency_id of "BTC"' do
      it 'returns info with correct name' do
        expect(subject.info('BTC')['name']).to eql "BitCoin"
      end
      it 'returns info with correct id' do
        expect(subject.info('BTC')['id']).to eql "3"
      end
    end
  end

  describe '#marketlist' do
    context 'with currency_id of "BTC"' do
      it 'returns info with correct id' do
        expect(subject.marketlist('BTC')['id']).to eql "3"
      end
      it 'returns markets info' do
        expect(subject.marketlist('BTC')['markets']).not_to eql nil
      end
    end
  end
end
