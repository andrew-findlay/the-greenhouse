source "https://rubygems.org"

# Use GitHub Pages gem which includes the correct Jekyll version
gem "github-pages", group: :jekyll_plugins

# Ruby 3.4+ compatibility
gem "csv"
gem "logger"
gem "base64"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-sitemap"
  gem "jekyll-seo-tag"
end

platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
