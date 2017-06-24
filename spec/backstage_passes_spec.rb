require './gilded_rose'

describe 'Backstage passes' do
  context 'to_s()' do
    it 'returns string output' do
      item = Item.new 'Backstage passes to a TAFKAL80ETC concert', 11, 11
      expect(item.to_s).to eq 'Backstage passes to a TAFKAL80ETC '\
      'concert, 11, 11'
    end
  end
end

describe 'Backstage passes' do
  describe 'GildedRose update()' do
    context 'sell-in is 20, quality is 20' do
      it 'quality increases by 1, sell_in decreases by 1' do
        tickets = gilded_rose_update('Backstage passes to a TAFKAL80ETC concert', 20, 20)
        expect(tickets[:sell_in]).to eq 19
        expect(tickets[:quality]).to eq 21
      end
    end

    context 'sell-in is 10, quality is 20' do
      it 'quality increases by 2, sell_in decreases by 1' do
        tickets = gilded_rose_update('Backstage passes to a TAFKAL80ETC concert', 10, 20)
        expect(tickets[:sell_in]).to eq 9
        expect(tickets[:quality]).to eq 22
      end
    end

    context 'sell-in is 5, quality is 20' do
      it 'increases quality by 3, sell_in decreases by 1' do
        tickets = gilded_rose_update('Backstage passes to a TAFKAL80ETC concert', 5, 20)
        expect(tickets[:sell_in]).to eq 4
        expect(tickets[:quality]).to eq 23
      end
    end

    context 'quality is 0, sell-in is 0' do
      it 'quality is never less than 0, sell-in is -1' do
        tickets = gilded_rose_update('Backstage passes to a TAFKAL80ETC concert', 0, 0)
        expect(tickets[:sell_in]).to eq(-1)
        expect(tickets[:quality]).to eq 0
      end
    end
  end
end
