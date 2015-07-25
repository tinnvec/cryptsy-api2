require 'codeclimate-test-reporter'
ENV['CODECLIMATE_REPO_TOKEN'] = '6923f8340c8b1bc2fed3707c98224bd79c3e9836e082e27f4dd2aea5873b3182'
CodeClimate::TestReporter.configure do |config|
  config.path_prefix = 'lib/cryptsy'
end
CodeClimate::TestReporter.start
