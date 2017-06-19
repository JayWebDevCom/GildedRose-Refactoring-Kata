require './gilded_rose'
require './lib/general'


describe 'Unspecified Item' do
  context 'sell-in is 20, quality is 20' do
    it 'quality decreases by 1, sell_in decreases by 1' do
      class_for_any_item = General.new
      an_item = Item.new('General item', 20, 20)
      class_for_any_item.update an_item
      expect(an_item.quality).to eq 19
      expect(an_item.sell_in).to eq 19
    end
  end

  context 'sell-in is 1, quality is 1' do
    it 'quality decreases by 1, sell_in decreases by 1' do
      class_for_any_item = General.new
      an_item = Item.new('General item', 1, 1)
      class_for_any_item.update an_item
      expect(an_item.quality).to eq 0
      expect(an_item.sell_in).to eq 0
    end
  end

  context 'sell-in is 0, quality is 0' do
    it 'quality never negative, sell_in decreases by 1' do
      class_for_any_item = General.new
      an_item = Item.new('General item', 0, 0)
      class_for_any_item.update an_item
      expect(an_item.quality).to eq 0
      expect(an_item.sell_in).to eq(-1)
    end
  end

  context 'sell-in is -1, quality is 0' do
    it 'quality never negative, sell_in decreases by 1' do
      class_for_any_item = General.new
      an_item = Item.new('General item', -1, 0)
      class_for_any_item.update an_item
      expect(an_item.sell_in).to eq(-2)
      expect(an_item.quality).to eq 0
      expect(an_item.quality).not_to eq(-1)
    end
  end

  context 'sell-in is -1, quality is 1' do
    it 'quality never negative, sell_in decreases by 1' do
      class_for_any_item = General.new
      an_item = Item.new('General item', -1, 1)
      class_for_any_item.update an_item
      expect(an_item.sell_in).to eq(-2)
      expect(an_item.quality).to eq 0
    end
  end

  context 'sell-in is 5, quality is 5' do
    it 'sell_in decreases by 1, quality decreases by 1 if '\
    'sell-in is positive' do
      class_for_any_item = General.new
      an_item = Item.new('General item', 5, 5)
      class_for_any_item.update an_item
      expect(an_item.sell_in).to eq 4
      expect(an_item.quality).to eq 4
    end
  end

  context 'sell-in is negative, quality is 3' do
    it 'quality never negative, quality decreases by 2 '\
    'sell_in decreases by 1' do
      class_for_any_item = General.new
      an_item = Item.new('General item', -1, 3)
      class_for_any_item.update an_item
      expect(an_item.sell_in).to eq(-2)
      expect(an_item.quality).to eq 1
    end
  end
end
