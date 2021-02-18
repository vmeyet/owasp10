source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'activerecord-session_store'
gem 'jbuilder', '~> 2.11'
gem 'puma', '~> 5'
gem 'rails', '~> 6'
gem 'sqlite3', '~> 1.3'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
end
