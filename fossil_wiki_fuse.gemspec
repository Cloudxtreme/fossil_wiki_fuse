Gem::Specification.new do |s|
  s.name        = 'fossil_wiki_fuse'
  s.version     = '0.0.2'
  s.date        = '2013-10-17'
  s.summary     = 'fossil wiki fuse'
  s.description = 'mount your fossil scm wiki on your filesystem'
  s.authors     = ['Olivier Abdesselam']
  s.files       = ['lib/fossil_wiki_fuse.rb']
  s.homepage    = 'http://rubygems.org/gems/fossil_wiki_fuse'
  s.license     = 'MIT'
  s.add_runtime_dependency "rfusefs", [">= 0"]
  s.executables << 'fossil_wiki_fuse'
  s.add_runtime_dependency "mocha", [">= 0"]
  s.add_runtime_dependency "rake", [">= 0"]
end
