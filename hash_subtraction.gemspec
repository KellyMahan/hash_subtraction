Gem::Specification.new do |s|
  s.name = "hash_subtraction"
  s.version = "1.0.0"

  s.author = "Kelly Mahan"
  s.email = "kmahan@kmahan.com"
  s.description = "hash_subtraction is a gem that provides methods for different subtractive methods for hashes"
  s.summary = "hash_subtraction is a gem that provides methods for different subtractive methods for hashes"
  s.homepage = "https://github.com/KellyMahan/hash_subtraction"

  s.add_development_dependency "rspec"
  s.add_development_dependency 'rake'
  s.files = Dir['lib/**/*']
  s.require_paths = ["lib"]
end