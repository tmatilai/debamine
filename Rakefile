require 'foodcritic'

desc "Run all tests"
task :default => [:foodcritic, :knife]

FoodCritic::Rake::LintTask.new do |t|
  t.files   = 'site-cookbooks'
  t.options = {:fail_tags => ['any']}
end

desc "Test cookbooks via knife"
task :knife do
  sh %{knife cookbook test -o site-cookbooks -a}
end
