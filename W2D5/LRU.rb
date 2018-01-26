class LRUCache
  attr_accessor :capacity, :cache

  def initialize(capacity)
    @cache = []
    @capacity = capacity
  end

  def count
    self.count
  end

  def add(el)
    if ache.include?(el)
      cache.delete(el)
        cache << el
      if cache.count == capacity
        cache.shift
        cache <<el
      end
    end
  end

  def show
    p self.cache
  end

  private
  # helper methods go here!

end
