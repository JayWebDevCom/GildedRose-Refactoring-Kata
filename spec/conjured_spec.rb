require './gilded_rose'

describe 'Conjured' do
  context 'to_s()' do
    it 'returns string output' do
      item = Item.new 'Conjured', 12, 12
      expect(item.to_s).to eq 'Conjured, 12, 12'
    end
  end
end

describe 'Conjured' do
  describe 'Product #update_quality' do
    context 'sell-in is 20, quality is 20' do
      it 'quality decreases by 2, sell_in decreases by 1' do
        items = [Item.new('Conjured', 20, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 18
      end
    end

    context 'sell-in is -1, quality is 20' do
      it 'quality decreases by 4, sell_in decreases by 1' do
        items = [Item.new('Conjured', -1, 20)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq(-2)
        expect(items[0].quality).to eq 16
      end
    end

    context 'sell-in is -1, quality is 0' do
      it 'quality never negative, sell_in decreases by 1' do
        items = [Item.new('Conjured', -1, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].sell_in).to eq(-2)
        expect(items[0].quality).to eq 0
      end
    end
  end
end
