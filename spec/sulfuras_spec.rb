require './gilded_rose'

describe 'Sulfuras, Hand of Ragnaros' do
  context 'to_s()' do
    it 'returns string output' do
      item = Item.new 'Sulfuras, Hand of Ragnaros', 10, 10
      expect(item.to_s).to eq 'Sulfuras, Hand of Ragnaros, 10, 10'
    end
  end
end

describe 'Product #update_quality' do
  describe 'Sulfuras, Hand of Ragnaros' do
    context 'legacy item' do
      it 'sell-in never changes, quality never changes' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 20, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 20
        expect(items[0].sell_in).to eq 20
      end

      it 'sell-in never changes, quality never changes' do
        items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq 0
      end
    end
  end
end
