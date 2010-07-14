require 'rubygems'
require 'trollop'

opts = Trollop::options do
  opt :size, "Size", :default=>"5x3" 
  opt :mine, "Mine", :type => String
end

width,height = opts[:size].split("x")[0,2]
if opts[:mine]
  mine_position_x,mine_position_y = opts[:mine].split("x")[0,2]
  mine_position_x = mine_position_x.to_i - 1
  mine_position_y = mine_position_y.to_i - 1
end

if width && height
  
  EMPTY = "."
  MINE="*"
  
  minesweeper_board = []
  
  height.to_i.times do |row|
    minesweeper_board_row = []
    width.to_i.times do |column|
      if opts[:mine] && (row) == mine_position_x.to_i && (column) == mine_position_y.to_i
        minesweeper_board_row << MINE
      else
        minesweeper_board_row << EMPTY
      end
    end
    minesweeper_board << minesweeper_board_row
  end
  
  if opts[:mine]
    #if mine_position_x-1 >= 0
      minesweeper_board[mine_position_x-1][mine_position_y-1] = "1"
      minesweeper_board[mine_position_x-1][mine_position_y] = "1"
      minesweeper_board[mine_position_x-1][mine_position_y+1] = "1"      
    #end
      
    #if mine_position_x+1 < (width.to_i - 1)
      minesweeper_board[mine_position_x+1][mine_position_y+1] = "1"
      minesweeper_board[mine_position_x+1][mine_position_y] = "1"
      minesweeper_board[mine_position_x+1][mine_position_y-1] = "1"
    #end
    
    #if mine_position_y-1 >= 0
      minesweeper_board[mine_position_x][mine_position_y-1] = "1"
    #end
    
    #if mine_position_y+1 < (height.to_i - 1)
      minesweeper_board[mine_position_x][mine_position_y+1] = "1"
    #end
  end

  minesweeper_board.each do |row|
    puts row.join
  end
  
end