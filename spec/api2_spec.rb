require 'cryptsy/api2'

describe Cryptsy::API2::Client do
  subject { Cryptsy::API2::Client.new(ENV['PUB_KEY'], ENV['PRIV_KEY']) }

  describe 'attributes' do
    it { is_expected.to respond_to(:user) }
    it { is_expected.to respond_to(:markets) }
    it { is_expected.to respond_to(:currencies) }
    it { is_expected.to respond_to(:order) }
    it { is_expected.to respond_to(:converter) }
    it { is_expected.to respond_to(:trigger) }
  end

  # describe '#user' do
  #   describe '#balances' do
  #
  #   end
  # end

  describe '#markets' do
    describe '#list' do
      it 'returns more than one market' do
        expect(subject.markets.list.count).to be > 1
      end
    end

    describe '#info' do
      context 'with market_id of "LTC_BTC"' do
        it 'returns id info of "3"' do
          expect(subject.markets.info('LTC_BTC')['id']).to eq "3"
        end
      end
    end

    describe '#volume' do
      context 'with no market_id' do
        it 'returns info for more than 1 market' do
          expect(subject.markets.volume.count).to be > 1
          expect(subject.markets.volume[0]['id']).not_to be_empty
        end
      end

      context 'with market_id of "LTC_BTC"' do
        it 'returns id info of "3"' do
          expect(subject.markets.volume('LTC_BTC')['id']).to eq "3"
        end
      end
    end

    describe '#ticker' do
      context 'with no market_id' do
        it 'returns info for more than 1 market' do
          expect(subject.markets.ticker.count).to be > 1
          expect(subject.markets.ticker[0]['id']).not_to be_empty
        end
      end

      context 'with market_id of "LTC_BTC"' do
        it 'returns id info of "3"' do
          expect(subject.markets.ticker('LTC_BTC')['id']).to eq "3"
        end
      end
    end

    describe '#fees' do
      context 'with market_id of "LTC_BTC"' do
        it 'returns info' do
          expect(subject.markets.fees('LTC_BTC')['buyfeepercent']).not_to be_nil
        end
      end
    end

    describe '#triggers' do
      context 'with market_id of "LTC_BTC"' do
        it 'returns info' do
          expect(subject.markets.triggers('LTC_BTC')).not_to be_nil
        end
      end
    end

    describe '#orderbook' do
      context 'with market_id of "LTC_BTC"' do
        it 'returns info' do
          expect(subject.markets.orderbook('LTC_BTC')['sellorders'].count).to be > 0
        end
      end
    end

    describe '#tradehistory' do
      context 'with market_id of "LTC_BTC"' do
        it 'returns info' do
          expect(subject.markets.tradehistory('LTC_BTC').count).to be > 0
        end
      end
    end
  end

  describe '#currencies' do
    describe '#list' do
      it 'returns more than one currency' do
        expect(subject.currencies.list.count).to be > 1
      end
    end

    describe '#info' do
      context 'with currency_id of "BTC"' do
        it 'returns name info of "BitCoin"' do
          expect(subject.currencies.info('BTC')['name']).to eq "BitCoin"
        end
        it 'returns id info of "3"' do
          expect(subject.currencies.info('BTC')['id']).to eq "3"
        end
      end
    end

    describe '#marketlist' do
      context 'with currency_id of "BTC"' do
        it 'returns id info of "3"' do
          expect(subject.currencies.marketlist('BTC')['id']).to eq "3"
        end
        it 'returns markets info' do
          expect(subject.currencies.marketlist('BTC')['markets']).not_to be_nil
        end
      end
    end
  end

  # describe '#order' do
  #
  # end

  # describe '#converter' do
  #
  # end

  # describe '#trigger' do
  #
  # end
end
