source 'https://rubygems.org'

ruby '2.2.3'                                # use rbenv or RVM to support this

gem 'rails', '~> 4.2.0'                     # downgrade to 4.1 is an option
gem 'activerecord-session_store'            # keep sessions in the database
gem 'pg'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'                    # JSON serializer
gem 'friendly_id', '~> 5.1.0'               # Slug generator
gem 'carrierwave', '~> 0.10.0'              # Form attachments helper
gem 'mini_magick', '~> 4.2.0'               # Uploaded images processing, dependency of Carrierwave
gem 'elasticsearch-model'                   # ES integration to ActiveRecord models
gem 'elasticsearch-rails'                   # ES Rails bridge
gem 'bootstrap-sass', '~> 3.3.0'            # For responsive scaffolding and some styles
gem 'sitemap_generator'                     # See config/sitemap.rb
gem 'bootstrap_form'                        # Form builder using bootstrap styles

gem 'fog', '~> 1.32.0', require: 'fog/aws/storage'        # Cloud APIs wrapper for file storage, only loading AWS support

gem 'pry-rails'                             # better REPL
gem 'puma'                                  # fast rails server
gem 'coveralls', require: false             # test coverage monitor

group :assets do
  gem 'coffee-rails', '~> 4.1.0'            # CoffeeScript transpiler
  gem 'sass-rails', '~> 5.0.0'              # SCSS/SASS syntax in stylesheets
  gem 'uglifier', '~> 2.7.0'                # JavaScript compressor
  gem 'execjs'                              # JavaScript engine wrapper; install nodejs to support this (`sudo apt-get install nodejs` on ubuntu)
end

group :development do
  gem 'better_errors'                       # Better error reporting and repl web console
  gem 'bullet'                              # Detect inefficient database access
end

group :development, :test do
  gem 'byebug'                              # debugger
  gem 'pry-byebug'                          # byebug execution control from pry
  gem 'pry-stack_explorer'                  # show and navigate stack in pry
  gem 'meta_request'                        # Chrome rails extension support
  gem 'dotenv-rails'                        # Easy environment configuration
  gem 'rspec'                               # behaviour testing
  gem 'rspec-rails'                         # RSpec extenstions for Rails
  gem 'factory_girl_rails'                  # mocking for testing
  gem 'database_cleaner'                    # Reset test database between examples
  gem 'quiet_assets'                        # don't clutter log with served assets
end

group :production do
  gem 'rails_12factor'                      # serving statis assets and logging to stdout
end
