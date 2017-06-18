# item type
class Conjured < FoodItem
  def update(item)
    item.sell_in -= SELL_IN_CHANGE
    return if item.quality.zero?
    item.quality -= SELL_IN_CHANGE * 2 if item.quality > 2
    item.quality -= SELL_IN_CHANGE * 2 if item.sell_in < 0 && item.quality > 2
  end
end
