require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Run I18n specs (check for missing & unused keys)."
RSpec::Core::RakeTask.new('spec:i18n') do |task|
  task.rspec_opts = "--tag i18n"
end
