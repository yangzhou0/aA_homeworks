require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){Array.new}
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    cups.each_index do |idx|
      next if idx == 6 || idx == 13
      cups[idx] = [:stone, :stone, :stone, :stone]
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if ![0..13].include?(start_pos) ||start_pos == 0 || start_pos == 13
  end

  def make_move(start_pos, current_player_name)
    number_of_stones = cups[start_pos].size
    cups[start_pos]=[]
    idx = start_pos
    number_of_stones.times do
      idx += 1
      idx = 0 if idx>13
      if idx == 6
        @cups[idx] << :stone if current_player_name == @name1
      elsif idx == 13
        @cups[idx] << :stone if current_player_name == @name2
      else
        @cups[idx] << :stone
      end
    end
    render
    next_turn(idx)
  end




  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].size == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?{|cup| cup.empty?} || cups[7..12].all?{|cup| cup.empty?}
  end

  def winner
    if (cups[6].size <=> cups[13].size) == -1
      @name2
    elsif (cups[6].size <=> cups[13].size) == 1
      @name1
    else
      :draw
    end

  end
end
