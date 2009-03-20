require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/testtask'
require 'rake/packagetask'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rake/contrib/rubyforgepublisher'
require 'fileutils'
include FileUtils
require File.join(File.dirname(__FILE__), 'lib', 'model_graph', 'version')

AUTHOR = "Rob Biedenharn"
EMAIL = "Rob_Biedenharn@alum.MIT.edu"
DESCRIPTION = <<eos
When run from the trunk of a Rails project, produces
# {DOT}[http://www.graphviz.org/doc/info/lang.html] output which can be
# rendered into a graph by programs such as dot and neato and viewed with
# Graphviz (an {Open Source}[http://www.graphviz.org/License.php] viewer).
eos
RUBYFORGE_PROJECT = "model-graph"
HOMEPATH = "http://#{RUBYFORGE_PROJECT}.rubyforge.org"
BIN_FILES = %w( model_graph )
RELEASE_TYPES = %w( gem ) # can use: gem, tar, zip


NAME = "model-graph"
REV = File.read(".svn/entries")[/committed-rev="(d+)"/, 1] rescue nil
VERS = ENV['VERSION'] || (ModelGraph::VERSION::STRING + (REV ? ".#{REV}" : ""))
CLEAN.include ['**/.*.sw?', '*.gem', '.config']
RDOC_OPTS = ['--quiet', '--title', "model_graph documentation",
    "--opname", "index.html",
    "--line-numbers", 
    "--main", "README",
    "--inline-source"]

desc "Packages up model_graph gem."
task :default => [:test]
task :package => [:clean]

Rake::TestTask.new("test") { |t|
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.verbose = true
}

spec =
    Gem::Specification.new do |s|
        s.name = NAME
        s.version = VERS
        s.platform = Gem::Platform::RUBY
        s.has_rdoc = true
        s.extra_rdoc_files = ["README", "CHANGELOG"]
        s.rdoc_options += RDOC_OPTS + ['--exclude', '^(examples|extras)/']
        s.summary = DESCRIPTION
        s.description = DESCRIPTION
        s.author = AUTHOR
        s.email = EMAIL
        s.homepage = HOMEPATH
        s.executables = BIN_FILES
        s.rubyforge_project = RUBYFORGE_PROJECT
        s.bindir = "bin"
        s.require_path = "lib"
        s.autorequire = "model_graph"

        #s.add_dependency('activesupport', '>=1.3.1')
        #s.required_ruby_version = '>= 1.8.2'

        s.files = %w(README CHANGELOG Rakefile) +
          Dir.glob("{bin,doc,test,lib,templates,generator,extras,website,script}/**/*") + 
          Dir.glob("ext/**/*.{h,c,rb}") +
          Dir.glob("examples/**/*.rb") +
          Dir.glob("tools/*.rb")
        
        # s.extensions = FileList["ext/**/extconf.rb"].to_a
    end

Rake::GemPackageTask.new(spec) do |p|
    p.need_tar = RELEASE_TYPES.include? 'tar'
    p.need_zip = RELEASE_TYPES.include? 'zip'
    p.gem_spec = spec
end

task :install => [ :package ] do
  name = "#{NAME}-#{VERS}.gem"
  sh %{sudo gem install pkg/#{name}}
end

task :uninstall => [:clean] do
  sh %{sudo gem uninstall #{NAME}}
end

desc "Publish the release files to RubyForge."
task :release => [ :package ] do
  system('rubyforge login')
  for ext in RELEASE_TYPES
    release_command = "rubyforge add_release #{RUBYFORGE_PROJECT} #{NAME} 'REL #{VERS}' pkg/#{NAME}-#{VERS}.#{ext}"
    puts release_command
    system(release_command)
  end
end
