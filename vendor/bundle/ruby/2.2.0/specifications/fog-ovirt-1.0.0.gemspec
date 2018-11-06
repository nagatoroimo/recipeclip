# -*- encoding: utf-8 -*-
# stub: fog-ovirt 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-ovirt"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ori Rabin"]
  s.date = "2018-03-20"
  s.description = "This library can be used as a module for `fog`."
  s.email = ["orabin@redhat.com"]
  s.homepage = "https://github.com/fog/fog-ovirt"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.2"
  s.summary = "Module for the 'fog' gem to support Ovirt."

  s.installed_by_version = "2.4.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fog-core>, ["~> 1.45"])
      s.add_runtime_dependency(%q<fog-json>, [">= 0"])
      s.add_runtime_dependency(%q<fog-xml>, ["~> 0.1.1"])
      s.add_runtime_dependency(%q<rbovirt>, ["~> 0.1.5"])
      s.add_development_dependency(%q<bundler>, ["~> 1.10"])
      s.add_development_dependency(%q<pry>, ["~> 0.10"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.52"])
      s.add_development_dependency(%q<shindo>, ["~> 0.3"])
    else
      s.add_dependency(%q<fog-core>, ["~> 1.45"])
      s.add_dependency(%q<fog-json>, [">= 0"])
      s.add_dependency(%q<fog-xml>, ["~> 0.1.1"])
      s.add_dependency(%q<rbovirt>, ["~> 0.1.5"])
      s.add_dependency(%q<bundler>, ["~> 1.10"])
      s.add_dependency(%q<pry>, ["~> 0.10"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rubocop>, ["~> 0.52"])
      s.add_dependency(%q<shindo>, ["~> 0.3"])
    end
  else
    s.add_dependency(%q<fog-core>, ["~> 1.45"])
    s.add_dependency(%q<fog-json>, [">= 0"])
    s.add_dependency(%q<fog-xml>, ["~> 0.1.1"])
    s.add_dependency(%q<rbovirt>, ["~> 0.1.5"])
    s.add_dependency(%q<bundler>, ["~> 1.10"])
    s.add_dependency(%q<pry>, ["~> 0.10"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rubocop>, ["~> 0.52"])
    s.add_dependency(%q<shindo>, ["~> 0.3"])
  end
end
