require './lib/food_item'
require './lib/backstage'
require './lib/aged_brie'
require './lib/conjured'
require './lib/general'

# runs update method on it's item class
class GildedRose
  def initialize(items)
    @items = items
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
      supporting_class = (CLASSES[item.name] || DEFAULT_CLASS).new
      supporting_class.update item
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
