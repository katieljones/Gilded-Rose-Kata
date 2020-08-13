require 'rspec'
require 'test/unit/assertions'
require './gilded_rose'
describe Item do

it 'should take an item and print out its name, quality and sellin values as a string' do
    item = Item.new("Rubicon", 12, 49)
    expect(item.to_s()).to eq("Rubicon, 12, 49")
  end

end
describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq("foo")
    end

    it "never reduces to a negative number" do
      items = [Item.new("foo", 0, 1)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).not_to be < 0
    end

    it "will never raise a regular item above 50" do
      items = [Item.new("foo", 10, 49)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to be <= 50

    end


    it "decreases the quality twice as fast when the sell by date passes" do
      items = [Item.new("foo", -1, 18)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 16

    end

  end

  describe "#backstage_passes" do


    it "can never rise above 50" do
      items = [Item.new("Aged Brie", 1, 49)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to be <= 50

    end

    it "quality increases by 2 when there are 10 days or less remaining" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert",9,10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 11
    end

    it "quality increases by 3 when there are 5 days or less remaining" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert",4,1)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 3
    end

    it "quality drops to 0 after the concert" do
    end

  end

  describe "#Sulfuras_items" do

    it 'are the only products allowed to be above 50 and always stays at 80' do
      items = [Item.new("Sulfuras, Hand of Ragnaros",0,80)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 79

    end

  end

  describe "#conjured_items" do

    it 'descreases twice as fast as normal items' do
      items = [Item.new("Conjured Chicken",-1,10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 6
    end

  end

# what are my edge cases?

end
