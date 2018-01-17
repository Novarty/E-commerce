source "https://rubygems.org"
ruby "2.4.2"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end



gem "rails", "~> 5.1.4"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "pg"
gem "devise"
gem "slim-rails"
gem "decent_decoration", "~> 0.1.0"
gem "decent_exposure", "3.0.0"
gem "draper", "~> 3.0.0"
gem "bootstrap", "~> 4.0.0.beta2.1"
gem "jquery-rails"
gem "responders"
gem "omniauth-google-oauth2"
gem "simple_form"
gem "paperclip", :git=> "https://github.com/thoughtbot/paperclip", :ref => "523bd46c768226893f23889079a7aa9c73b57d68"


group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "rspec-rails", "~> 3.6"
  gem "aws-sdk", "< 2.0"
  gem "figaro"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
