require './gilded_rose'

describe 'Unspecified Item' do
  context 'to_s()' do
    it 'returns string output' do
      item = Item.new 'General item', 12, 12
      expect(item.to_s).to eq 'General item, 12, 12'
    end
  end
end

describe 'Unspecified Item' do
  describe 'GildedRose update()' do
    context 'sell-in is 20, quality is 20' do
      it 'quality decreases by 1, sell_in decreases by 1' do
        genreal_item = gilded_rose_update('General item', 20, 20)
        expect(genreal_item[:sell_in]).to eq 19
        expect(genreal_item[:quality]).to eq 19
      end
    end

    context 'sell-in is 1, quality is 1' do
      it 'quality decreases by 1, sell_in decreases by 1' do
        genreal_item = gilded_rose_update('General item', 1, 1)
        expect(genreal_item[:sell_in]).to eq 0
        expect(genreal_item[:quality]).to eq 0
      end
    end

    context 'sell-in is 0, quality is 0' do
      it 'quality never negative, sell_in decreases by 1' do
        genreal_item = gilded_rose_update('General item', 0, 0)
        expect(genreal_item[:sell_in]).to eq(-1)
        expect(genreal_item[:quality]).to eq 0
      end
    end

    context 'sell-in is -1, quality is 0' do
      it 'quality never negative, sell_in decreases by 1' do
        genreal_item = gilded_rose_update('General item', -1, 0)
        expect(genreal_item[:sell_in]).to eq(-2)
        expect(genreal_item[:quality]).to eq(0)
      end
    end

    context 'sell-in is -1, quality is 1' do
      it 'quality never negative, sell_in decreases by 1' do
        genreal_item = gilded_rose_update('General item', -1, 1)
        expect(genreal_item[:sell_in]).to eq(-2)
        expect(genreal_item[:quality]).to eq 0
      end
    end

    context 'sell-in is 5, quality is 5' do
      it 'sell_in decreases by 1, quality decreases by 1 if '\
      'sell-in is positive' do
        genreal_item = gilded_rose_update('General item', 5, 5)
        expect(genreal_item[:sell_in]).to eq 4
        expect(genreal_item[:quality]).to eq 4
      end
    end

    context 'sell-in is negative, quality is 3' do
      it 'quality never negative, quality decreases by 2 '\
      'sell_in decreases by 1' do
        genreal_item = gilded_rose_update('General item', -1, 3)
        expect(genreal_item[:sell_in]).to eq(-2)
        expect(genreal_item[:quality]).to eq 1
      end
    end
  end
end
