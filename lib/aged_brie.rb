# item type
class AgedBrie < FoodItem
  def update(item)
    item.sell_in -= SELL_IN_CHANGE
    return if item.quality == 50
    item.quality += SELL_IN_CHANGE
    item.quality += SELL_IN_CHANGE if item.sell_in < 0
  end
end
