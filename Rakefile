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

task :dojo do
  print "Enter your name: "
  name = STDIN.gets
  system("git checkout iteration-1")
  system("git branch -D #{name}")
  system("git checkout -b #{name}")

  iteration = 1
  until iteration > 5
    system("cucumber features")
    unless $?.exitstatus == 0
      puts "FAIL! Better fix that. Hit a key to run the tests again when you're ready..."
      STDIN.gets
    end
    if $?.exitstatus == 0
      iteration += 1
      if iteration <= 5
        puts "WIN! Ready for the next iteration? Here we go..."
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