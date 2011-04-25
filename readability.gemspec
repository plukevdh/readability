# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.authors = ["Luke van der Hoeven"]
  s.email = ["hungerandthirst@gmail.com"]

  s.name = "readability-engine"
  s.summary = "A simple engine to allow you to tie into Readability for auth or API access"
  s.description = "This gem/engine allows you to access Readability APIs."
  
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.markdown"]
  s.version = "0.0.6"
  
  s.add_dependency('yajl-ruby')
  s.add_dependency('oauth')
end
