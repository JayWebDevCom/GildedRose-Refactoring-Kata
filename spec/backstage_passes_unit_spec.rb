require './gilded_rose'
require './lib/backstage'

describe 'Backstage' do
  it 'quality cannot be greater than 50' do
    backstage = Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 50)
    backstage_class = Backstage.new
    backstage_class.update backstage
    expect(backstage.sell_in).to eq 19
    expect(backstage.quality).to eq 50
  end
  it 'quality cannot be less than 0' do
    backstage = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 0)
    backstage_class = Backstage.new
    backstage_class.update backstage
    expect(backstage.sell_in).to eq(-1)
    expect(backstage.quality).to eq 0
  end
  it 'quality increases by 1 when sell_in is greater than 10' do
    backstage = Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 20)
    backstage_class = Backstage.new
    backstage_class.update backstage
    expect(backstage.sell_in).to eq 10
    expect(backstage.quality).to eq 21
  end
  it 'quality increases by 2 when sell_in is less than 10' do
    backstage = Item.new('Backstage passes to a TAFKAL80ETC concert', 9, 3)
    backstage_class = Backstage.new
    backstage_class.update backstage
    expect(backstage.sell_in).to eq 8
    expect(backstage.quality).to eq 5
  end
  it 'quality increases by 3 when sell_in is less than 5' do
    backstage = Item.new('Backstage passes to a TAFKAL80ETC concert', 3, 20)
    backstage_class = Backstage.new
    backstage_class.update backstage
    expect(backstage.sell_in).to eq 2
    expect(backstage.quality).to eq 23
  end
end
