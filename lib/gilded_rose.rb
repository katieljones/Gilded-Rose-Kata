class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      return if item.name == "Sulfuras"
      if item.name == "Aged Brie"
        item.quality += 1 if item.quality < 50
        if item.sell_in < 0
          item.quality += 1 if item.quality < 50
        end
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in < 11
          item.quality += 1 if item.quality < 50
        end
        if item.sell_in < 6
          item.quality += 1 if item.quality < 50
        end
        if item.sell_in < 0
          item.quality -= item.quality
        end
      elsif item.name == "Conjured Chicken"
        item.quality -= 1 if item.quality > 0
        item.quality -= 1 if item.quality > 0
          if item.sell_in < 0
            item.quality -= 1 if item.quality > 0
            item.quality -= 1 if item.quality > 0
          end
      else
        item.quality -= 1 if item.quality > 0
        if item.sell_in < 0
          item.quality -= 1 if item.quality > 0
        end
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
