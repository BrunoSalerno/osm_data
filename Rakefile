require 'rake/testtask'

task :console do
  require "./lib/element_collection"
  require "./lib/node"
  require "./lib/way"
  require "./lib/relation"
  require 'pry'
  binding.pry
end

Rake::TestTask.new do |t|
  t.description = "Run tests"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
  t.warning = false
end
