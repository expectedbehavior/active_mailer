# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "active_mailer"
  s.summary     = "Audit you some emails!"
  s.description = "A gem that makes it really easy to audit your emails as well as validate them."
  s.authors     = ["Matt Gordon"]
  s.email       = 'support@expectedbehavior.com'
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
  s.homepage    =
    'https://github.com/expectedbehavior/active_mailer'
  
  
  s.required_rubygems_version = "> 1.3.6"
 
  s.add_dependency "activesupport" , "~> 3.2"
  s.add_dependency "rails"         , "~> 3.2"
 
  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
