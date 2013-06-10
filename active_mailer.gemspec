# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "active_mailer"
  s.summary     = "Adds model-level validation to emails."
  s.description = "Application that have complext email sending logic have DRYness problems. ActiveMailersolves that by making a legitimate email model where all sending logic belongs. Also capable of acting as an audit trail for email sending."
  s.authors     = ["Matt Gordon"]
  s.email       = 'support@expectedbehavior.com'
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.6"
  s.homepage    =
    'https://github.com/expectedbehavior/active_mailer'
  
  
  s.required_rubygems_version = "> 1.3.6"
 
  s.add_dependency "activesupport" , "~> 3.2"
  s.add_dependency "rails"         , "~> 3.2"
 
  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
