require './gilded_rose'
require './lib/conjured'

describe 'Conjured Using Its Supporting Class' do
  context 'sell-in is 20, quality is 20' do
    it 'quality decreases by 2, sell_in decreases by 1' do
      conjured_class = Conjured.new
      conjured = Item.new 'Conjured', 20, 20
      conjured_class.update conjured
      expect(conjured.sell_in).to eq 19
      expect(conjured.quality).to eq 18
    end
  end

  context 'sell-in is 5, quality is 5' do
    it 'quality decreases by 2, sell_in decreases by 1' do
      conjured_class = Conjured.new
      conjured = Item.new 'Conjured', 5, 5
      conjured_class.update conjured
      expect(conjured.sell_in).to eq 4
      expect(conjured.quality).to eq 3
    end
  end

  context 'sell-in is -1, quality is 20' do
    it 'quality decreases by 4, sell_in decreases by 1' do
      conjured_class = Conjured.new
      conjured = Item.new 'Conjured', -1, 20
      conjured_class.update conjured
      expect(conjured.sell_in).to eq(-2)
      expect(conjured.quality).to eq 16
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
