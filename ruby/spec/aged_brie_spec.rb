require './gilded_rose'

describe 'Product #update_quality' do

  describe "Aged Brie" do

    context 'sell-in is 20, quality is 20' do
      it "increases quality by 1, sell_in decreases by 1" do
        items = [Item.new("Aged Brie", 20, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 21

      end
    end

    context 'sell_in is 20, quality is 50' do
      it "quality does not change above 50, sell_in decreases by 1" do
        items = [Item.new("Aged Brie", 20, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 19
        expect(items[0].quality).to eq 50
      end
    end

    context 'quality is 0, sell-in is 1' do
      it "quality increases by 2, sell-in decreases by 1" do
        items = [Item.new("Aged Brie", 0, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).not_to eq 0
      end
    end

  end

end
