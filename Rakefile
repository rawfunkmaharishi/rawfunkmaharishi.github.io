require 'html/proofer'

task :test do
  sh "bundle exec jekyll build"

  ignored = [
    /localhost/
  ]

  HTML::Proofer.new("./_site", ssl_verifypeer: false, timeout: 30, href_ignore: ignored).run
end

task :default => [:test]
