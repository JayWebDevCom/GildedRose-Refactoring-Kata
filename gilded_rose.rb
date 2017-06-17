class GildedRose

  def initialize(items)
    @items = items
  end

  def sulfuras_update item
    @item = General.new(item.sell_in, item.quality)
    @item.sulfuras_update item
  end

  def backstage_update item
    @item = General.new(item.sell_in, item.quality)
    @item.backstage_update item
  end

  def aged_brie_update item
    @item = General.new(item.sell_in, item.quality)
    @item.aged_brie_update item
  end

  def general_update item
    @item = General.new(item.sell_in, item.quality)
    @item.general_update item
  end

  def update_quality()
    @items.each do |item|
    case item.name
    when 'Sulfuras, Hand of Ragnaros'
      sulfuras_update item
    when 'Backstage passes to a TAFKAL80ETC concert'
      backstage_update item
    when 'Aged Brie'
      aged_brie_update item
    else
      general_update item
    end
    end
  end

end

class General
  attr_accessor :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def general_update item
    item.sell_in -= 1
    return if item.quality == 0
    item.quality -= 1
    item.quality -= 1 if item.sell_in < 0 && item.quality > 0
  end

  def aged_brie_update item
    item.sell_in -= 1
    return if item.quality == 50
    item.quality += 1
    item.quality += 1 if item.sell_in < 0
  end

  def backstage_update item
    item.sell_in -= 1
    return if item.quality >= 50
    return item.quality = 0 if item.sell_in < 0
    item.quality += 1
    item.quality += 1 if item.sell_in < 10
    item.quality += 1 if item.sell_in < 5
  end

  def sulfuras_update item
  end

end


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
