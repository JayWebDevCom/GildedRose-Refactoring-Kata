class GildedRose

  def initialize(items)
    @items = items
  end

  def update_sulfuras item
  end

  def update_backstage item
    item.sell_in -= 1
    if item.sell_in <= 5 && item.sell_in > 0
      item.quality += 3
    elsif item.sell_in <= 10 && item.sell_in > 0
      item.quality += 2
    elsif item.sell_in <= 0
      item.quality = 0
    else
      item.quality += 1
    end
  end

  def update_aged_brie item
    item.sell_in -= 1
    return if item.quality == 50
    item.quality += 1
    item.quality += 1 if item.sell_in < 0
  end

  def update_unspecified item
    item.sell_in -= 1
    item.quality -= 1 if item.sell_in >= 0 && item.quality >= 1
    item.quality -= 1 if item.sell_in < 0 && item.quality > 0
    item.quality -= 1 if item.sell_in < 0 && item.quality > 0
  end

  def update_quality()

    @items.each do |item|

    case item.name
    when 'Sulfuras, Hand of Ragnaros'
      update_sulfuras item
    when 'Backstage passes to a TAFKAL80ETC concert'
      update_backstage item
    when 'Aged Brie'
      update_aged_brie item
    when 'Unspecified item'
      update_unspecified item
    else
    end

    end
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
