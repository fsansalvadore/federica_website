# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :contentful do |f|
  f.space         = { site: ENV['CONTENTFUL_SPACE_ID'] }
  f.access_token  = ENV['CONTENTFUL_ACCESS_TOKEN']
  f.content_types = {
    homePages: 'homePage',
    generals: 'informazioniGenerali',
    pages: 'paginaInterna'
     }
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# activate :directory_indexes

data.site.pages.each do |_, page|
  proxy "/#{page.directory.downcase.gsub(' ', '-')}/#{page.slug.downcase}/index.html", "/page-template.html", :locals => { :page => page }, :ignore => true
end

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

configure :development do
  activate :dotenv
  activate :livereload
  config[:host] = "http://localhost:4567"
end

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :gzip
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  config[:host] = "https://www.federicaburziopsicologa.it"
end

activate :s3_sync do |s3|
  s3.prefer_gzip = true
end
