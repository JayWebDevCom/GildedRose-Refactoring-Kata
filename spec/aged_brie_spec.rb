require './gilded_rose'
require 'spec_helper'

describe 'Aged Brie' do
  context 'to_s()' do
    it 'returns string output' do
      item = Item.new 'Aged Brie', 12, 12
      expect(item.to_s).to eq 'Aged Brie, 12, 12'
    end
  end
end

describe 'Aged Brie' do
  describe 'GildedRose update()' do
    context 'sell-in is 20, quality is 20' do
      it 'increases quality by 1, sell_in decreases by 1' do
        aged_Brie = gilded_rose_update('Aged Brie', 20, 20)
        expect(aged_Brie[:sell_in]).to eq 19
        expect(aged_Brie[:quality]).to eq 21
      end
    end

    context 'sell_in is 20, quality is 50' do
      it 'quality does not change above 50, sell_in still decreases by 1' do
        aged_Brie = gilded_rose_update('Aged Brie', 20, 50)
        expect(aged_Brie[:sell_in]).to eq 19
        expect(aged_Brie[:quality]).to eq 50
      end
    end

    context 'sell-in is 3, quality is 3' do
      it 'quality increases by 1, sell-in decreases by 1' do
        aged_Brie = gilded_rose_update('Aged Brie', 3, 3)
        expect(aged_Brie[:sell_in]).to eq 2
        expect(aged_Brie[:quality]).to eq 4
      end
    end

    context 'sell-in is 1, quality is 1' do
      it 'quality increases by 1, sell-in decreases by 1' do
        aged_Brie = gilded_rose_update('Aged Brie', 1, 1)
        expect(aged_Brie[:sell_in]).to eq 0
        expect(aged_Brie[:quality]).to eq 2
      end
    end

    context 'sell-in is 0 or less, quality is 0' do
      it 'quality increases by 2, sell-in decreases by 1' do
        aged_Brie = gilded_rose_update('Aged Brie', 0, 0)
        expect(aged_Brie[:sell_in]).to eq(-1)
        expect(aged_Brie[:quality]).to eq 2
      end
    end

    context 'sell-in is 4, quality is 4' do
      it 'quality increases by 1, sell-in decreases by 1' do
        aged_Brie = gilded_rose_update('Aged Brie', 4, 4)
        expect(aged_Brie[:sell_in]).to eq 3
        expect(aged_Brie[:quality]).to eq 5
      end
    end
  end
end
