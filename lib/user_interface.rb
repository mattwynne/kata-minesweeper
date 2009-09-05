require 'optparse'

class UserInterface
  def initialize(command_line_args)
    cli_args_parser.parse!(command_line_args)
    
    unless @size
      puts o
      exit
    end
  end

  def start
    print_welcome_message
    print_help
    print_command_prompt

    until command =~ /q/
      print_command_prompt
    end

    print_goodbye_message
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

  def print_welcome_message
    puts "Welcome to minesweeper"
  end

  def print_goodbye_message
    puts "Goodbye!"
    puts
  end
  
  def print_revealed_board
    puts "TODO"
  end

  def print_help
    puts
    puts "  Commands:"
    puts "  q - quit the game"
    puts
  end

  def print_command_prompt
    print ">"
    STDOUT.flush
  end

  def command
    STDIN.gets.strip
  end
end