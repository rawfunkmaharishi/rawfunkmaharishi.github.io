require 'html/proofer'

task :test do
  sh "bundle exec jekyll build"

  ignored = [
    /localhost/,
    /username.github.io/,
    /bandname.github.io/,
    /bandname.com/
  ]

  HTML::Proofer.new("./_site", ssl_verifypeer: false, timeout: 30, href_ignore: ignored).run
end

task :default => [:test]
