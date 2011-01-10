# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tfidf_ja}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["K.Nishi"]
  s.date = %q{2011-01-11}
  s.description = %q{
    tfidf_ja computes TF-IDF with a dictionary.
    This gem include a Japanese IDF dictionary that were prepared in Yahoo! API.
  }
  s.email = %q{24signals@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "dic/idf.dic",
    "lib/dictionary.rb",
    "lib/tfidf_ja.rb",
    "lib/tfidf_ja/igo_extension.rb",
    "lib/utility.rb"
  ]
  s.homepage = %q{http://github.com/kyow/tfidf_ja}
  s.licenses = ["MIT"]
  s.rdoc_options = ["-c UTF-8", "-S", "-U"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Computes TF-IDF with Japanese dictionary.}
  s.test_files = [
    "spec/spec_helper.rb",
    "spec/tfidf_ja_spec.rb",
    "test/create_idf_dic.rb",
    "test/test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<igo-ruby>, ["> 0.1"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<igo-ruby>, ["> 0.1"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<igo-ruby>, ["> 0.1"])
  end
end

