require 'user_interface'

class Minesweeper
  
  def initialize(size, mines)
    @size, @mines = size, mines
  end
  
  def width
    @size[1].to_i
  end
  
  def height
    @size[0].to_i
  end
  
  def board_character(x,y)
    if mine_at(x,y)
      '*'
    else
      count = count_mines_near(x,y)
      count > 0 ? count : '.'
    end
  end
  
  def mine_at(x,y)
    @mines.include?([x+1,y+1])
  end
  
  def count_mines_near(x,y)
    count = 0
    around(x) do |x2|
      around(y) do |y2|
        count += 1 if mine_at(x2, y2)
      end
    end
    return count
  end
  
  def around(val)
    ((val-1)..(val+1)).each { |i| yield i }
  end
end
