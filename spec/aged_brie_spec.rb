require './gilded_rose'

describe 'Aged Brie' do
  context 'to_s()' do
    it 'returns string output' do
      item = Item.new 'Aged Brie', 12, 12
      expect(item.to_s).to eq 'Aged Brie, 12, 12'
    end
  end
end

describe 'Product #update_quality' do

  describe 'Aged Brie' do

    context 'sell-in is 20, quality is 20' do
      it "increases quality by 1, sell_in decreases by 1" do
        items = [Item.new('Aged Brie', 20, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 21
      end
    end

    context 'sell_in is 20, quality is 50' do
      it "quality does not change above 50, sell_in still decreases by 1" do
        items = [Item.new('Aged Brie', 20, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 50
      end
    end

    context 'sell-in is 3, quality is 3' do
      it "quality increases by 1, sell-in decreases by 1" do
        items = [Item.new('Aged Brie', 3, 3)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 2
        expect(items[0].quality).to eq 4
      end
    end

    context 'sell-in is 1, quality is 1' do
      it "quality increases by 1, sell-in decreases by 1" do
        items = [Item.new('Aged Brie', 1, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
        expect(items[0].quality).to eq 2
      end
    end

    context 'sell-in is 0 or less, quality is 0' do
      it "quality increases by 2, sell-in decreases by 1" do
        items = [Item.new('Aged Brie', 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 2
      end
    end

    context 'sell-in is 4, quality is 4' do
      it "quality increases by 1, sell-in decreases by 1" do
        items = [Item.new('Aged Brie', 4, 4)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 3
        expect(items[0].quality).to eq 5
      end
    end

  end

end
