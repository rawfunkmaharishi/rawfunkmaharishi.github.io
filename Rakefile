require 'html/proofer'

task :test do
  sh "bundle exec jekyll build"

  ignored = [
    /localhost/,
    /username.github.io/,
    /bandname.github.io/,
    /bandname.com/,
    # These 403, I guess because of a duff User-Agent (but see below)
    /https:\/\/www.w3.org\/People\/Berners-Lee/,
    /http:\/\/opendatacommons.org\/licenses\/odbl/
  ]

  HTML::Proofer.new("./_site",
                    ssl_verifypeer: false,
                    timeout: 30,
                    href_ignore: ignored,
                    validate_html: true,
#                    typhoeus: {
#                      headers: {
#                        "User-Agent" => "Mozilla/5.0 (compatible; HTML Proofer)"
#                      }
#                    }
                  ).run
end

task :default => [:test]
