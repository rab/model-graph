Dir[File.join(File.dirname(__FILE__), '**/*.rb')].sort.each { |lib| require lib }
