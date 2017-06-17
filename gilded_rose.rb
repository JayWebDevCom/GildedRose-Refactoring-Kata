# runs update method on it's item class
class GildedRose
  SELL_IN_CHANGE = 1
  def initialize(items)
    @items = items
  end

  # inheritance provision of update(item) method
  class FoodItem
    def update(item); end
  end

  # item type
  class AgedBrie < FoodItem
    def update(item)
      item.sell_in -= SELL_IN_CHANGE
      return if item.quality == 50
      item.quality += SELL_IN_CHANGE
      item.quality += SELL_IN_CHANGE if item.sell_in < 0
    end
  end

  # item type
  class Backstage < FoodItem
    def update(item)
      item.sell_in -= SELL_IN_CHANGE
      return if item.quality >= 50
      return if item.quality.zero? && item.sell_in < 0
      item.quality += SELL_IN_CHANGE
      item.quality += SELL_IN_CHANGE if item.sell_in < 10
      item.quality += SELL_IN_CHANGE if item.sell_in < 5
    end
  end

  # item type for normal behaviour
  class General < FoodItem
    def update(item)
      item.sell_in -= SELL_IN_CHANGE
      return if item.quality.zero?
      item.quality -= SELL_IN_CHANGE
      item.quality -= SELL_IN_CHANGE if item.sell_in < 0 && item.quality > 0
    end
  end

  # item type
  class Conjured < FoodItem
    def update(item)
      item.sell_in -= SELL_IN_CHANGE
      return if item.quality.zero?
      item.quality -= SELL_IN_CHANGE * 2 if item.quality > 2
      item.quality -= SELL_IN_CHANGE * 2 if item.sell_in < 0 && item.quality > 2
    end
  end

  CLASSES = {
    'Sulfuras, Hand of Ragnaros' => FoodItem,
    'Conjured' => Conjured,
    'Backstage passes to a TAFKAL80ETC concert' => Backstage,
    'Aged Brie' => AgedBrie
  }.freeze

  DEFAULT_CLASS = General

  def update_quality
    @items.each do |item|
      @item = (CLASSES[item.name] || DEFAULT_CLASS).new
      @item.update item
    end
  end
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
