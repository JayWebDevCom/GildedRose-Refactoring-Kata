# runs update method on it's item class
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      @item = (CLASSES[item.name] || DEFAULT_CLASS).new
      @item.update item
    end
  end

  # initialize method and update(item) inheritance provision
  class MakeEasier
    def initialize; end

    def update(item); end
  end

  # item type
  class AgedBrie < MakeEasier
    def update(item)
      item.sell_in -= 1
      return if item.quality == 50
      item.quality += 1
      item.quality += 1 if item.sell_in < 0
    end
  end

  # item type
  class Backstage < MakeEasier
    def update(item)
      item.sell_in -= 1
      return if item.quality >= 50
      return if item.quality.zero? && item.sell_in < 0
      item.quality += 1
      item.quality += 1 if item.sell_in < 10
      item.quality += 1 if item.sell_in < 5
    end
  end

  # item type
  class General < MakeEasier
    def update(item)
      item.sell_in -= 1
      return if item.quality.zero?
      item.quality -= 1
      item.quality -= 1 if item.sell_in < 0 && item.quality > 0
    end
  end

  CLASSES = {
    'Sulfuras, Hand of Ragnaros' => MakeEasier,
    'Backstage passes to a TAFKAL80ETC concert' => Backstage,
    'Aged Brie' => AgedBrie
  }.freeze

  DEFAULT_CLASS = General
end

# item type
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
