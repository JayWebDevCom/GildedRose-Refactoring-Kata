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
