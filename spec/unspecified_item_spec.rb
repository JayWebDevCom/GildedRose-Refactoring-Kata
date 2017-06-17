require './gilded_rose'

describe "Unspecified Item" do
  context 'to_s()' do
    it 'returns string output' do
      item = Item.new 'General item', 12, 12
      expect(item.to_s).to eq 'General item, 12, 12'
    end
  end
end

describe 'Product #update_quality' do

  describe "Unspecified Item" do

    context 'sell-in is 20, quality is 20' do
      it "quality decreases by 1, sell_in decreases by 1" do
        items = [Item.new("General item", 20, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 19
        expect(items[0].sell_in).to eq 19
      end
    end

    context 'sell-in is 1, quality is 1' do
      it "quality decreases by 1, sell_in decreases by 1" do
        items = [Item.new("General item", 1, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq 0
      end
    end

    context 'sell-in is 0, quality is 0' do
      it "quality never negative, sell_in decreases by 1" do
        items = [Item.new("General item", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq -1
      end
    end

    context 'sell-in is -1, quality is 0' do
      it "quality never negative, sell_in decreases by 1" do
        items = [Item.new("General item", -1, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -2
        expect(items[0].quality).to eq 0
        expect(items[0].quality).not_to eq -1
      end
    end

    context 'sell-in is -1, quality is 1' do
      it "quality never negative, sell_in decreases by 1" do
        items = [Item.new("General item", -1, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -2
        expect(items[0].quality).to eq 0
      end
    end

    context 'sell-in is 5, quality is 5' do
      it "sell_in decreases by 1, quality decreases by 1 if sell-in is positive" do
        items = [Item.new("General item", 5, 5)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 4
        expect(items[0].quality).to eq 4
      end
    end

    context 'sell-in is negative, quality is 3' do
      it "quality never negative, quality decreases by 2 sell_in decreases by 1" do
        items = [Item.new("General item", -1, 3)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -2
        expect(items[0].quality).to eq 1
      end
    end

  end

end
