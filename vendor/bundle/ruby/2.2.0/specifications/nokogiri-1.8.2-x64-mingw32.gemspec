# -*- encoding: utf-8 -*-
# stub: nokogiri 1.8.2 x64-mingw32 lib

Gem::Specification.new do |s|
  s.name = "nokogiri"
  s.version = "1.8.2"
  s.platform = "x64-mingw32"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Aaron Patterson", "Mike Dalessio", "Yoko Harada", "Tim Elliott", "Akinori MUSHA"]
  s.date = "2018-01-29"
  s.description = "Nokogiri (\u{92f8}) is an HTML, XML, SAX, and Reader parser.  Among\nNokogiri's many features is the ability to search documents via XPath\nor CSS3 selectors."
  s.email = ["aaronp@rubyforge.org", "mike.dalessio@gmail.com", "yokolet@gmail.com", "tle@holymonkey.com", "knu@idaemons.org"]
  s.executables = ["nokogiri"]
  s.extra_rdoc_files = ["CHANGELOG.md", "CONTRIBUTING.md", "C_CODING_STYLE.rdoc", "LICENSE-DEPENDENCIES.md", "LICENSE.md", "Manifest.txt", "README.md", "ROADMAP.md", "STANDARD_RESPONSES.md", "Y_U_NO_GEMSPEC.md", "suppressions/README.txt", "ext/nokogiri/html_document.c", "ext/nokogiri/html_element_description.c", "ext/nokogiri/html_entity_lookup.c", "ext/nokogiri/html_sax_parser_context.c", "ext/nokogiri/html_sax_push_parser.c", "ext/nokogiri/nokogiri.c", "ext/nokogiri/xml_attr.c", "ext/nokogiri/xml_attribute_decl.c", "ext/nokogiri/xml_cdata.c", "ext/nokogiri/xml_comment.c", "ext/nokogiri/xml_document.c", "ext/nokogiri/xml_document_fragment.c", "ext/nokogiri/xml_dtd.c", "ext/nokogiri/xml_element_content.c", "ext/nokogiri/xml_element_decl.c", "ext/nokogiri/xml_encoding_handler.c", "ext/nokogiri/xml_entity_decl.c", "ext/nokogiri/xml_entity_reference.c", "ext/nokogiri/xml_io.c", "ext/nokogiri/xml_libxml2_hacks.c", "ext/nokogiri/xml_namespace.c", "ext/nokogiri/xml_node.c", "ext/nokogiri/xml_node_set.c", "ext/nokogiri/xml_processing_instruction.c", "ext/nokogiri/xml_reader.c", "ext/nokogiri/xml_relax_ng.c", "ext/nokogiri/xml_sax_parser.c", "ext/nokogiri/xml_sax_parser_context.c", "ext/nokogiri/xml_sax_push_parser.c", "ext/nokogiri/xml_schema.c", "ext/nokogiri/xml_syntax_error.c", "ext/nokogiri/xml_text.c", "ext/nokogiri/xml_xpath_context.c", "ext/nokogiri/xslt_stylesheet.c"]
  s.files = ["CHANGELOG.md", "CONTRIBUTING.md", "C_CODING_STYLE.rdoc", "LICENSE-DEPENDENCIES.md", "LICENSE.md", "Manifest.txt", "README.md", "ROADMAP.md", "STANDARD_RESPONSES.md", "Y_U_NO_GEMSPEC.md", "bin/nokogiri", "ext/nokogiri/html_document.c", "ext/nokogiri/html_element_description.c", "ext/nokogiri/html_entity_lookup.c", "ext/nokogiri/html_sax_parser_context.c", "ext/nokogiri/html_sax_push_parser.c", "ext/nokogiri/nokogiri.c", "ext/nokogiri/xml_attr.c", "ext/nokogiri/xml_attribute_decl.c", "ext/nokogiri/xml_cdata.c", "ext/nokogiri/xml_comment.c", "ext/nokogiri/xml_document.c", "ext/nokogiri/xml_document_fragment.c", "ext/nokogiri/xml_dtd.c", "ext/nokogiri/xml_element_content.c", "ext/nokogiri/xml_element_decl.c", "ext/nokogiri/xml_encoding_handler.c", "ext/nokogiri/xml_entity_decl.c", "ext/nokogiri/xml_entity_reference.c", "ext/nokogiri/xml_io.c", "ext/nokogiri/xml_libxml2_hacks.c", "ext/nokogiri/xml_namespace.c", "ext/nokogiri/xml_node.c", "ext/nokogiri/xml_node_set.c", "ext/nokogiri/xml_processing_instruction.c", "ext/nokogiri/xml_reader.c", "ext/nokogiri/xml_relax_ng.c", "ext/nokogiri/xml_sax_parser.c", "ext/nokogiri/xml_sax_parser_context.c", "ext/nokogiri/xml_sax_push_parser.c", "ext/nokogiri/xml_schema.c", "ext/nokogiri/xml_syntax_error.c", "ext/nokogiri/xml_text.c", "ext/nokogiri/xml_xpath_context.c", "ext/nokogiri/xslt_stylesheet.c", "suppressions/README.txt"]
  s.homepage = "http://nokogiri.org"
  s.licenses = ["MIT"]
  s.post_install_message = "Nokogiri is built with the packaged libraries: libxml2-2.9.7, libxslt-1.1.32, zlib-1.2.11, libiconv-1.15.\n"
  s.rdoc_options = ["--main", "README.md"]
  s.required_ruby_version = Gem::Requirement.new(["< 2.6", ">= 2.2"])
  s.rubygems_version = "2.4.5.2"
  s.summary = "Nokogiri (\u{92f8}) is an HTML, XML, SAX, and Reader parser"

  s.installed_by_version = "2.4.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mini_portile2>, ["~> 2.3.0"])
      s.add_development_dependency(%q<hoe-bundler>, ["~> 1.2"])
      s.add_development_dependency(%q<hoe-debugging>, ["~> 1.4"])
      s.add_development_dependency(%q<hoe-gemspec>, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-git>, ["~> 1.6"])
      s.add_development_dependency(%q<minitest>, ["~> 5.8.4"])
      s.add_development_dependency(%q<rake>, ["~> 12.0"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 1.0.3"])
      s.add_development_dependency(%q<rake-compiler-dock>, ["~> 0.6.2"])
      s.add_development_dependency(%q<racc>, ["~> 1.4.14"])
      s.add_development_dependency(%q<rexical>, ["~> 1.0.5"])
      s.add_development_dependency(%q<concourse>, ["~> 0.15"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.16"])
    else
      s.add_dependency(%q<mini_portile2>, ["~> 2.3.0"])
      s.add_dependency(%q<hoe-bundler>, ["~> 1.2"])
      s.add_dependency(%q<hoe-debugging>, ["~> 1.4"])
      s.add_dependency(%q<hoe-gemspec>, ["~> 1.0"])
      s.add_dependency(%q<hoe-git>, ["~> 1.6"])
      s.add_dependency(%q<minitest>, ["~> 5.8.4"])
      s.add_dependency(%q<rake>, ["~> 12.0"])
      s.add_dependency(%q<rake-compiler>, ["~> 1.0.3"])
      s.add_dependency(%q<rake-compiler-dock>, ["~> 0.6.2"])
      s.add_dependency(%q<racc>, ["~> 1.4.14"])
      s.add_dependency(%q<rexical>, ["~> 1.0.5"])
      s.add_dependency(%q<concourse>, ["~> 0.15"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.16"])
    end
  else
    s.add_dependency(%q<mini_portile2>, ["~> 2.3.0"])
    s.add_dependency(%q<hoe-bundler>, ["~> 1.2"])
    s.add_dependency(%q<hoe-debugging>, ["~> 1.4"])
    s.add_dependency(%q<hoe-gemspec>, ["~> 1.0"])
    s.add_dependency(%q<hoe-git>, ["~> 1.6"])
    s.add_dependency(%q<minitest>, ["~> 5.8.4"])
    s.add_dependency(%q<rake>, ["~> 12.0"])
    s.add_dependency(%q<rake-compiler>, ["~> 1.0.3"])
    s.add_dependency(%q<rake-compiler-dock>, ["~> 0.6.2"])
    s.add_dependency(%q<racc>, ["~> 1.4.14"])
    s.add_dependency(%q<rexical>, ["~> 1.0.5"])
    s.add_dependency(%q<concourse>, ["~> 0.15"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.16"])
  end
end