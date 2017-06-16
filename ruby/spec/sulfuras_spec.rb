require './gilded_rose'

describe 'Product #update_quality' do
  describe "Sulfuras, Hand of Ragnaros" do
    context 'legacy item' do
      it "sell-in never changes, quality never changes" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 20, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 20
        expect(items[0].sell_in).to eq 20
      end
    end
  end
end
