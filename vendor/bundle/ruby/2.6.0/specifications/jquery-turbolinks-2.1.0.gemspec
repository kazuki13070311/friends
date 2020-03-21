# -*- encoding: utf-8 -*-
# stub: jquery-turbolinks 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jquery-turbolinks".freeze
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sasha Koss".freeze]
  s.date = "2014-08-29"
  s.description = "jQuery plugin for drop-in fix binded events problem caused by Turbolinks".freeze
  s.email = "koss@nocorp.me".freeze
  s.homepage = "https://github.com/kossnocorp/jquery.turbolinks".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "jQuery plugin for drop-in fix binded events problem caused by Turbolinks".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.1.0"])
      s.add_runtime_dependency(%q<turbolinks>.freeze, [">= 0"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 3.1.0"])
      s.add_dependency(%q<turbolinks>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.1.0"])
    s.add_dependency(%q<turbolinks>.freeze, [">= 0"])
  end
end
