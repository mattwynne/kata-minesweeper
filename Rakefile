require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format progress"
  t.rcov = false
end

task :default => :features do
  puts
  puts
  puts "Features passed OK. Now what does your flog look like? (Hint: low is good)"
  puts
  system("flog #{File.dirname(__FILE__)}/lib/*.rb")
end

task :start_dojo do
end

task :dojo do
  def run_cukes
    system("cucumber features")

    unless $?.exitstatus == 0
      puts
      puts "FAIL! Better fix that. Hit [ENTER] to run the tests again when you're ready..."
      STDIN.gets
    end
  end

  def init(name)
    system("git checkout iteration-1")
    exit $?.exitstatus unless ($?.exitstatus == 0)
    system("git branch -D #{name}")
    system("git checkout -b #{name}")
  end

  def get_name
    print "Enter your name: "
    STDIN.gets
  end

  def success?
    $?.exitstatus == 0
  end

  init(get_name)

  iteration = 1
  until iteration > 5
    run_cukes

    if success?
      if iteration <= 5
        system("git add .")
        system(%Q{git commit -m "iteration #{iteration} tests passing."})
        puts
        puts
        puts "WIN!"

        puts "Perhaps you would care for a spot of refactoring at this point?"

        go_next = false
        until go_next
          message = "Press [ENTER] to run the tests again (with refactoring tips)"
          message << ", [SPACE ENTER] to move to the next iteration" if success?
          puts message

          go_next = (STDIN.gets == " \n")
          system("rake")
          go_next = go_next and success?
        end
        system(%Q{git commit -m "iteration #{iteration} refactored."})

        # move to next iteration
        iteration += 1
        system("git merge iteration-#{iteration}")
      else
        puts "EPIC WIN! Now to play the refactoring game..."
        until false
          system("rake")
          puts "Not bad. Can you do any better? (Hit a key to re-run the flog)"
          STDIN.gets
        end
      end
    end
  end
end