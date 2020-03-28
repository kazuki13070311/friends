# -*- encoding: utf-8 -*-
# stub: capistrano-harrow 0.5.3 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-harrow".freeze
  s.version = "0.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lee Hambley".freeze, "Dario Hamidi".freeze]
  s.bindir = "exe".freeze
  s.date = "2016-07-28"
  s.description = "Hooks to allow people experiencing problems with Capistrano to register with a service to get help and have a smoother workflow.".freeze
  s.email = ["leehambley@harrow.io".freeze, "dariohamidi@harrow.io".freeze]
  s.homepage = "https://github.com/harrowio/capistrano-harrow".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "\n     ___   _   ___ ___ ___ _____ ___    _   _  _  ___\n    / __| /_\\ | _ \\_ _/ __|_   _| _ \\  /_\\ | \\| |/ _ \\\n   | (__ / _ \\|  _/| |\\__ \\ | | |   / / _ \\| .` | (_) |\n    \\___/_/ \\_\\_| |___|___/ |_| |_|_\\/_/ \\_\\_|\\_|\\___/\n\n    Learn about our web-based collaboration and\n    automation platform for Capistrano: hrw.io/auto-cap\n\n".freeze
  s.rubygems_version = "3.0.6".freeze
  s.summary = "A plugin to improve the user experience for users of Capistrano and Harrow".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_development_dependency(%q<pry>.freeze, ["= 0.10.3"])
      s.add_development_dependency(%q<json>.freeze, ["= 1.8.3"])
      s.add_development_dependency(%q<byebug>.freeze, ["= 8.2.4"])
      s.add_development_dependency(%q<sinatra>.freeze, ["= 1.4.7"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_dependency(%q<pry>.freeze, ["= 0.10.3"])
      s.add_dependency(%q<json>.freeze, ["= 1.8.3"])
      s.add_dependency(%q<byebug>.freeze, ["= 8.2.4"])
      s.add_dependency(%q<sinatra>.freeze, ["= 1.4.7"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<pry>.freeze, ["= 0.10.3"])
    s.add_dependency(%q<json>.freeze, ["= 1.8.3"])
    s.add_dependency(%q<byebug>.freeze, ["= 8.2.4"])
    s.add_dependency(%q<sinatra>.freeze, ["= 1.4.7"])
  end
end
