# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "readability"
  s.summary = "A simple engine to allow you to tie into Readability for auth or API access"
  s.description = "This gem/engine allows you to access Readability APIs."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
end
