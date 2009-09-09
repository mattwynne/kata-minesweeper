require 'optparse'
require 'minesweeper'

class UserInterface
  def initialize(command_line_args)
    cli_args_parser.parse!(command_line_args)
    @mines ||= []
    
    unless @size
      puts cli_args_parser
      exit
    end
  end

  def start
    # Immediately quit: no other functionality required yet.
    print_revealed_board
  end

  private
  
  def cli_args_parser
    OptionParser.new do |opts|
      opts.accept(Array, /\[.*\]/) do |arg|
        eval(arg)
      end
      
      opts.on("--size=[width,height]", :REQUIRED, Array) do |size|
        @size = size
      end
      
      opts.on("--mines=[[x,y],[x',y'], ... ]", Array) do |mines|
        @mines = mines
      end
    end
  end

  def print_revealed_board
    minesweeper = Minesweeper.new(@size, @mines)
    minesweeper.width.times do |y|
      minesweeper.height.times do |x|
        print minesweeper.board_character(x,y)
      end
      puts
    end
  end
end