def slow_octopus(fish)
  longest_fish =fish.first
  longest_spot = 0
  fish.each_with_index do |fish,i|
    fish.each_with_index do |other_fish,j|
      if other_fish.count >= fish.count
        longest_fish = other_fish
        longest_spot=j
      end
    end
    longest_fish
    longest_spot
end

def dominant_octopus(fish)
  prc=Proc.new(|x,y| x.length <=> y.length)
  fish.merge_sort(&prc).last
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def clever_ocrupus(fish)
  longest = fish[0]
  fish.each do |el|
    longest = el if el.length > longest.length
  end
  longest
end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def constatnt_dance (direction, tiles_hash)
  tiles_hash[direction]
end
