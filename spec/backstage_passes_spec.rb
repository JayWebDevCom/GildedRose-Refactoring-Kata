require './gilded_rose'

describe "Unspecified Item" do
  context 'to_s()' do
    it 'returns string output' do
      item = Item.new 'Backstage passes to a TAFKAL80ETC concert', 11, 11
      expect(item.to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 11, 11'
    end
  end
end

describe 'Product #update_quality' do

  describe "Backstage passes" do

    context 'sell-in is 20, quality is 20' do
      it "quality increases by 1, sell_in decreases by 1" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 21

      end
    end

    context 'sell-in is 10, quality is 20' do
      it "quality increases by 2, sell_in decreases by 1" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 22

      end
    end

    context 'sell-in is 5, quality is 20' do
      it "increases quality by 3, sell_in decreases by 1" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 4
        expect(items[0].quality).to eq 23
      end
    end

    context 'quality is 0, sell-in is 0' do
      it "quality is never less than 0, sell-in is -1" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 0

      end
    end

  end

end
