# -*- encoding: utf-8 -*-
# stub: capistrano-rbenv-vars 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-rbenv-vars".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Zane Shannon".freeze]
  s.date = "2015-02-03"
  s.description = "Capistrano plugin for installing rbenv-vars\nWorks with Capistrano 3 (only!). For Capistrano 2 support see:\nhttps://github.com/yyuu/capistrano-rbenv\n".freeze
  s.email = ["zane@zaneshannon.com".freeze]
  s.homepage = "https://github.com/zshannon/capistrano-rbenv-vars".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Capistrano plugin for installing rbenv-vars.".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>.freeze, [">= 3.0"])
      s.add_runtime_dependency(%q<capistrano-rbenv>.freeze, [">= 2.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<capistrano>.freeze, [">= 3.0"])
      s.add_dependency(%q<capistrano-rbenv>.freeze, [">= 2.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>.freeze, [">= 3.0"])
    s.add_dependency(%q<capistrano-rbenv>.freeze, [">= 2.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
