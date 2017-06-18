# item type for normal behaviour
class General < FoodItem
  def update(item)
    item.sell_in -= SELL_IN_CHANGE
    return if item.quality.zero?
    item.quality -= SELL_IN_CHANGE
    item.quality -= SELL_IN_CHANGE if item.sell_in < 0 && item.quality > 0
  end
end
