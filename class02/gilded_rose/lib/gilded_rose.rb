class GildedRose
  attr_reader :name, :quality, :days_remaining

  def initialize(name, quality, days_remaining)
    @name, @quality, @days_remaining = name, quality, days_remaining
  end

  def tick
    if @name == 'normal'
      normal_tick
    elsif @name == 'Aged Brie'
      brie_tick
    elsif @name == 'Sulfuras, Hand of Ragnaros'      
    elsif @name == 'Backstage passes to a TAFKAL80ETC concert'
      backstage_tick
    else
      if @name != 'Aged Brie' && @name != 'Backstage passes to a TAFKAL80ETC concert'
        if @quality > 0
          if @name != 'Sulfuras, Hand of Ragnaros'
            @quality -= 1
          end
        end
      else
        if @quality < 50
          @quality += 1
          if @name == 'Backstage passes to a TAFKAL80ETC concert'
            if @days_remaining < 11
              if @quality < 50
                @quality += 1
              end
            end
            if @days_remaining < 6
              if @quality < 50
                @quality += 1
              end
            end
          end
        end
      end
      if @name != 'Sulfuras, Hand of Ragnaros'
        @days_remaining -= 1
      end
      if @days_remaining < 0
        if @name != "Aged Brie"
          if @name != 'Backstage passes to a TAFKAL80ETC concert'
            if @quality > 0
              if @name != 'Sulfuras, Hand of Ragnaros'
                @quality -= 1
              end
            end
          else
            @quality = @quality - @quality
          end
        else
          if @quality < 50
            @quality += 1
          end
        end
      end
    end
  end

  private
    def normal_tick
      @quality -= 1 if @quality > 0
      @quality -= 1 if @days_remaining <= 0

      @days_remaining -= 1
    end

    def brie_tick
      @quality += 1 if @quality < 50
      @quality += 1 if @days_remaining <= 0

      @days_remaining -= 1
    end
    def backstage_tick
      @quality += 3 if @days_remaining < 10 && @days_remaining != 6
      @quality += 2 if @days_remaining == 10 || @days_remaining == 6
      @quality += 1 if @days_remaining > 10 && @quality < 50
      @quality = 0 if @days_remaining <= 0 && @quality = 50
      @days_remaining -= 1
    end
end