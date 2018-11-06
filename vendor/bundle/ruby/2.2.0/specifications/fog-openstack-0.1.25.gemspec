# -*- encoding: utf-8 -*-
# stub: fog-openstack 0.1.25 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-openstack"
  s.version = "0.1.25"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Matt Darby"]
  s.bindir = "exe"
  s.date = "2018-03-20"
  s.description = "OpenStack fog provider gem."
  s.email = ["matt.darby@rackspace.com"]
  s.homepage = "https://github.com/fog/fog-openstack"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0")
  s.rubygems_version = "2.4.5.2"
  s.summary = "OpenStack fog provider gem"

  s.installed_by_version = "2.4.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fog-core>, ["~> 1.40"])
      s.add_runtime_dependency(%q<fog-json>, [">= 1.0"])
      s.add_runtime_dependency(%q<ipaddress>, [">= 0.8"])
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<mime-types>, [">= 0"])
      s.add_development_dependency(%q<mime-types-data>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rubocop>, [">= 0"])
      s.add_development_dependency(%q<shindo>, ["~> 0.3"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<webmock>, ["~> 1.24.6"])
    else
      s.add_dependency(%q<fog-core>, ["~> 1.40"])
      s.add_dependency(%q<fog-json>, [">= 1.0"])
      s.add_dependency(%q<ipaddress>, [">= 0.8"])
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<mime-types>, [">= 0"])
      s.add_dependency(%q<mime-types-data>, [">= 0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rubocop>, [">= 0"])
      s.add_dependency(%q<shindo>, ["~> 0.3"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<webmock>, ["~> 1.24.6"])
    end
  else
    s.add_dependency(%q<fog-core>, ["~> 1.40"])
    s.add_dependency(%q<fog-json>, [">= 1.0"])
    s.add_dependency(%q<ipaddress>, [">= 0.8"])
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<mime-types>, [">= 0"])
    s.add_dependency(%q<mime-types-data>, [">= 0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rubocop>, [">= 0"])
    s.add_dependency(%q<shindo>, ["~> 0.3"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<webmock>, ["~> 1.24.6"])
  end
end
