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
    it 'returns more than one currency' do
      expect(subject.list.count).to be > 1
    end
  end

  describe '#info' do
    context 'with currency_id of "BTC"' do
      it 'returns name info of "BitCoin"' do
        expect(subject.info('BTC')['name']).to eql "BitCoin"
      end
      it 'returns id info of "3"' do
        expect(subject.info('BTC')['id']).to eql "3"
      end
    end
  end

  describe '#marketlist' do
    context 'with currency_id of "BTC"' do
      it 'returns id info of "3"' do
        expect(subject.marketlist('BTC')['id']).to eql "3"
      end
      it 'returns markets info' do
        expect(subject.marketlist('BTC')['markets']).not_to eql nil
      end
    end
  end
end

describe Cryptsy::API2::Markets do
  subject { Cryptsy::API2::Markets.new }

  describe '#list' do
    it 'returns more than one market' do
      expect(subject.list.count).to be > 1
    end
  end
end
