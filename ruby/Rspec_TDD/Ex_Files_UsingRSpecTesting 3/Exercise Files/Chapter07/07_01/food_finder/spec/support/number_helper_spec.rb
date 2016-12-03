# encoding: UTF-8

describe 'NumberHelper' do

  include NumberHelper

  describe '#number_to_currency' do

    context 'using default values' do

      it "correctly formats an integer" do
        expect(number_to_currency(10)).to eq('$10.00')
      end

      it "correctly formats a float" do
        expect(number_to_currency(10.5)).to eq('$10.50')
      end

      it "correctly formats a string" do
        expect(number_to_currency('10')).to eq('$10.00')
      end

      it "uses delimiters for very large numbers" do
        expect(number_to_currency(100_000_000)).to eq('$100,000,000.00')
      end

      it "does not have delimiters for small numbers" do
        expect(number_to_currency(0.5)).to eq('$0.50')
      end

    end

    context 'using custom options' do

      it 'allows changing the :unit' do
        expect(number_to_currency(10, :unit => '¥')).to eq('¥10.00')
      end

      it 'allows changing the :precision' do
        expect(number_to_currency(10, :precision => 3)).to eq('$10.000')
      end

      it 'omits the separator if :precision is 0' do
        expect(number_to_currency(10, :precision => 0)).to eq('$10')
      end

      it 'allows changing the :delimiter' do
        expect(number_to_currency(100_000_000, :delimiter => '_')).to eq('$100_000_000.00')
      end
      it 'allows changing the :separator' do
        expect(number_to_currency(100, :separator => '|')).to eq('$100|00')
      end

      it 'correctly formats using multiple options' do
        expect(number_to_currency(100_000_000.5, :separator => '|', :delimiter => '_', :precision => 3, :unit => '¥')).to eq('¥100_000_000|500')
      end

    end

  end

end
