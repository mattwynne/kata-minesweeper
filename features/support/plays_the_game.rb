module PlaysTheGame
  def start_game(options)
    minesweeper_cmd = File.expand_path(File.dirname(__FILE__) + '/../../bin/minesweeper')
    cmd = "#{minesweeper_cmd} --size=#{options[:size].inspect.gsub(/ /,'')}"
    cmd << " --mines=#{options[:mines].inspect.gsub(/ /,'')}" if options[:mines]
    @game = IO.popen("#{cmd}", File::RDWR)
  end
  
  def read_to_command_prompt
    (char = read_next_char) until char == '>'
  end
  
  def read_next_char
    @game.getc.chr
  end
end

World PlaysTheGame