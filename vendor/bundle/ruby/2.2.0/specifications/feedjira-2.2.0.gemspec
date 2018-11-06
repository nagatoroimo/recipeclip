# -*- encoding: utf-8 -*-
# stub: feedjira 2.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "feedjira"
  s.version = "2.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Paul Dix", "Julien Kirch", "Ezekiel Templin", "Jon Allured"]
  s.date = "2018-09-01"
  s.email = "feedjira@gmail.com"
  s.homepage = "http://feedjira.com"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.4.5.2"
  s.summary = "A feed fetching and parsing library"

  s.installed_by_version = "2.4.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>, [">= 0.9"])
      s.add_runtime_dependency(%q<faraday_middleware>, [">= 0.9"])
      s.add_runtime_dependency(%q<loofah>, [">= 2.0"])
      s.add_runtime_dependency(%q<sax-machine>, [">= 1.0"])
      s.add_development_dependency(%q<danger>, [">= 0"])
      s.add_development_dependency(%q<danger-commit_lint>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rubocop>, ["= 0.46"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.9"])
    else
      s.add_dependency(%q<faraday>, [">= 0.9"])
      s.add_dependency(%q<faraday_middleware>, [">= 0.9"])
      s.add_dependency(%q<loofah>, [">= 2.0"])
      s.add_dependency(%q<sax-machine>, [">= 1.0"])
      s.add_dependency(%q<danger>, [">= 0"])
      s.add_dependency(%q<danger-commit_lint>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rubocop>, ["= 0.46"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<faraday>, [">= 0.9"])
    s.add_dependency(%q<faraday_middleware>, [">= 0.9"])
    s.add_dependency(%q<loofah>, [">= 2.0"])
    s.add_dependency(%q<sax-machine>, [">= 1.0"])
    s.add_dependency(%q<danger>, [">= 0"])
    s.add_dependency(%q<danger-commit_lint>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rubocop>, ["= 0.46"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.9"])
  end
end
