require './gilded_rose'

describe 'Product #update_quality' do

  describe "Unspecified Item" do

    context 'sell-in is 20, quality is 20' do
      it "quality decreases by 1, sell_in decreases by 1" do
        items = [Item.new("Unspecified item", 20, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 19
        expect(items[0].sell_in).to eq 19
      end
    end

    context 'sell-in is 1, quality is 1' do
      it "quality decreases by 1, sell_in decreases by 1" do
        items = [Item.new("Unspecified item", 1, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq 0
      end
    end

    context 'sell-in is 0, quality is 0' do
      it "quality never negative, sell_in decreases by 1" do
        items = [Item.new("Unspecified item", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
        expect(items[0].sell_in).to eq -1
      end
    end

    context 'sell-in is -1, quality is 0' do
      it "quality never negative, sell_in decreases by 1" do
        items = [Item.new("Unspecified item", -1, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -2
        expect(items[0].quality).to eq 0
        expect(items[0].quality).not_to eq -1
      end
    end

    context 'sell-in is -1, quality is 1' do
      it "quality never negative, sell_in decreases by 1" do
        items = [Item.new("Unspecified item", -1, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -2
        expect(items[0].quality).to eq 0
      end
    end

  end

end
