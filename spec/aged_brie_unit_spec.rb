require './gilded_rose'
require './lib/aged_brie'


describe 'AgedBrie' do
  it 'increases quality by 1, sell_in decreases by 1' do
    aged_brie = Item.new('Aged Brie', 20, 20)
    aged_brie_class = AgedBrie.new
    aged_brie_class.update aged_brie
    expect(aged_brie.sell_in).to eq 19
    expect(aged_brie.quality).to eq 21
  end
end
