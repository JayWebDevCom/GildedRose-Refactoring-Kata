require './gilded_rose'
require './lib/aged_brie'

describe 'Aged Brie Using Its Supporting Class' do
  context 'sell-in is 20, quality is 20' do
    it 'increases quality by 1, sell_in decreases by 1' do
      aged_brie = Item.new('Aged Brie', 20, 20)
      aged_brie_class = AgedBrie.new
      aged_brie_class.update aged_brie
      expect(aged_brie.sell_in).to eq 19
      expect(aged_brie.quality).to eq 21
    end
  end
  context 'sell-in is -1, quality is 20' do
    it 'sell_in has passed - quality increases by 2, sell_in decreases by 1' do
      aged_brie = Item.new('Aged Brie', -1, 20)
      aged_brie_class = AgedBrie.new
      aged_brie_class.update aged_brie
      expect(aged_brie.sell_in).to eq(-2)
      expect(aged_brie.quality).to eq 22
    end
  end
end
