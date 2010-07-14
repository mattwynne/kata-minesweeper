# This is so we can name the path as normal in the features, and aruba will know 
# where to find our executable.
ENV['PATH'] = ENV['PATH'] + ":#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}"
