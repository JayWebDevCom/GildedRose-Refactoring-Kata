require './gilded_rose'
require './lib/base_item'

describe 'Sulfuras, Hand of Ragnaros Using Its Supporting Class' do
  context 'legacy item' do
    it 'sell-in never changes, quality never changes' do
      sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 20, 20)
      sulfuras_class = BaseItem.new
      sulfuras_class.update sulfuras
      expect(sulfuras.quality).to eq 20
      expect(sulfuras.sell_in).to eq 20
    end
  end

  context 'legacy item' do
    it 'sell-in never changes, quality never negative' do
      sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 0, 0)
      sulfuras_class = BaseItem.new
      sulfuras_class.update sulfuras
      expect(sulfuras.quality).to eq 0
      expect(sulfuras.sell_in).to eq 0
    end
  end
end
