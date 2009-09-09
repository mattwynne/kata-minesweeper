require 'optparse'

class UserInterface
  def initialize(command_line_args)
    cli_args_parser.parse!(command_line_args)
    
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
    #puts "mines was: #{@mines.inspect}"
    @size[1].to_i.times do |y|
      @size[0].to_i.times do |x|
        print board_character(x,y)
      end
      puts
    end
  end
  
  def board_character(x,y)
    if @mines.nil? ||@mines.empty?
      '.'
    elsif mine_at(x,y)
      '*'
    else
      '1'
    end
  end
  
  def mine_at(x,y)
    @mines.include?([x+1,y+1])
  end
end