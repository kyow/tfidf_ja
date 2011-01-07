require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "tfidf_ja"
  gem.homepage = "http://github.com/kyow/tfidf_ja"
  gem.license = "MIT"
  gem.summary = %Q{Computes TF-IDF with Japanese dictionary.}
  gem.description = %Q{
    tfidf_ja computes TF-IDF with a dictionary.
    This gem include a Japanese IDF dictionary that were prepared in Yahoo! API.
  }
  gem.email = "24signals@gmail.com"
  gem.authors = ["K.Nishi"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
  
  # gems dependency
  gem.add_runtime_dependency 'igo-ruby', '> 0.1'
  
  # include files
  gem.files = Rake::FileList.new('lib/**/*.rb', '[A-Z]*', 'dic/idf.dic')
  
  # required gems version
  gem.required_rubygems_version = ">1.3.6"
  
  # for RDoc encoding
  gem.rdoc_options << '-c UTF-8' << '-S' << '-U'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "tfidf_ja #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
